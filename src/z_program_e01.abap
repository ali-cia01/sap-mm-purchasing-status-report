*&---------------------------------------------------------------------*
*&      Form  INITIALIZATION_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM initialization_data .
  CLEAR: s_po_dt[].
  CLEAR: s_gr_dt[].

  CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
    EXPORTING
      date      = sy-datum
      days      = 0
      months    = 3
      signum    = '-'
      years     = 0
    IMPORTING
      calc_date = s_po_dt-low.

  s_po_dt-sign   = 'I'.
  s_po_dt-option = 'BT'.
  s_po_dt-high   = sy-datum.
  APPEND s_po_dt.


  CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
    EXPORTING
      date      = sy-datum
      days      = 0
      months    = 3
      signum    = '-'
      years     = 0
    IMPORTING
      calc_date = s_gr_dt-low.

  s_gr_dt-sign   = 'I'.
  s_gr_dt-option = 'BT'.
  s_gr_dt-high   = sy-datum.
  APPEND s_gr_dt.

 IMPORT s_plant FROM MEMORY ID 'ZBC_memory_splant'.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  MODIFY_SCREEN
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM modify_screen .
  LOOP AT SCREEN.
    IF screen-group1 = 'OBL' OR screen-group1 = 'PO' OR  screen-group1 = 'GR'.
      screen-intensified = '1'.
    ENDIF.

    CASE 'X'.
      WHEN spo.
        IF screen-group1 = 'PO'.
          screen-active = '1'.
        ENDIF.
        IF screen-group1 = 'GR'.
          screen-active = '0'.
        ENDIF.

      WHEN lb_gr.
        IF screen-group1 = 'PO'.
          screen-active = '0'.
        ENDIF.
        IF screen-group1 = 'GR'.
          screen-active = '1'.
        ENDIF.
      WHEN i_gr_ir.
    ENDCASE.

    MODIFY SCREEN.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  INPUT_CHECK
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM input_check .
  IF sscrfields-ucomm = 'ONLI' OR sscrfields-ucomm = 'RET'. "execute, enter
    CASE 'X'.
      WHEN spo.
        IF s_plant IS INITIAL OR s_po_dt[] IS INITIAL.
          MESSAGE 'PUT A VALID VALUE !~!' TYPE 'E'.
        ENDIF.
      WHEN lb_gr.
        IF s_plant IS INITIAL OR s_gr_dt[] IS INITIAL.
          MESSAGE 'PUT A VALID VALUE !~!' TYPE 'E'.
        ENDIF.
      WHEN i_gr_ir.
        IF s_plant IS INITIAL OR s_po_dt[] IS INITIAL OR s_gr_dt[] IS INITIAL.
          MESSAGE 'PUT A VALID VALUE !~!' TYPE 'E'.
        ENDIF.

    ENDCASE.

  ENDIF.

  EXPORT s_plant TO MEMORY ID 'ZBC_memory_splant'.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DATAS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_datas .
  CASE 'X'.
    WHEN spo.
      PERFORM get_data_first.
    WHEN lb_gr.
      PERFORM ger_data_second.
    WHEN i_gr_ir.
      PERFORM ger_data_third.
  ENDCASE.

  IF gt_display IS NOT INITIAL.
    CALL SCREEN 100.
  ENDIF.
ENDFORM.
