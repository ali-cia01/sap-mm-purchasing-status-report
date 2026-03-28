*----------------------------------------------------------------------*
***INCLUDE ZBC427_MMEXERCISE_04_O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'DYN'.
  CASE 'X'.
    WHEN spo.
      SET TITLEBAR 'SCREEN01'.
    WHEN lb_gr.
      SET TITLEBAR 'SCREEN02'.
    WHEN i_gr_ir.
      SET TITLEBAR 'SCREEN03'.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  CLEAR_OKCODE  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE clear_okcode OUTPUT.
  CLEAR ok_code.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  CREATE_AND_TRANSFER  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE create_and_transfer OUTPUT.
  IF go_container IS INITIAL.
    CREATE OBJECT go_container
      EXPORTING
        container_name = 'MY_CONTROL_AREA'
      EXCEPTIONS
        OTHERS         = 1.
    IF sy-subrc <>  0.
      MESSAGE a010(bc405_408).
    ENDIF.

    CREATE OBJECT go_grid
      EXPORTING
        i_parent = go_container
      EXCEPTIONS
        OTHERS   = 1.
    IF sy-subrc <>  0.
      MESSAGE a010(bc405_408).
    ENDIF.

    PERFORM set_fieldcat.

    gs_layout-cwidth_opt = 'X'.
    gs_layout-excp_led   = 'X'.

    DATA: g_handler TYPE REF TO lcl_event_handler.
    CREATE OBJECT g_handler.
    SET HANDLER g_handler->handle_double_click FOR go_grid. 

    "set HANDLER lcl_event_handler=>handle_double_click for go_grid.

    go_grid->set_table_for_first_display(

    EXPORTING
    is_layout = gs_layout
    CHANGING
     it_outtab = gt_display
     it_fieldcatalog = gt_field_cat
      it_sort = gt_sort
    EXCEPTIONS
    OTHERS = 1
    ).
    IF sy-subrc <>  0.
      MESSAGE a010(bc405_408).
    ENDIF.

  ENDIF.

ENDMODULE.
