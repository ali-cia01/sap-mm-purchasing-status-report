*&---------------------------------------------------------------------*
*&  Include           ZBC427_MMEXERCISE_04_CLS
*&---------------------------------------------------------------------*
CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.
    METHODS handle_double_click
             FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING e_row e_column es_row_no.
ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.
  METHOD handle_double_click.
    READ TABLE gt_display INTO gs_display INDEX e_row-index.
    IF sy-subrc = 0 AND e_column-fieldname = 'EBELN'.
      SET PARAMETER ID 'BES' FIELD gs_display-ebeln.
      CALL TRANSACTION 'ME23N' AND SKIP FIRST SCREEN.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
