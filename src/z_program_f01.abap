
*&---------------------------------------------------------------------*
*&      Form  SET_FIELDCAT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_fieldcat .

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'EKGRP'.
  gs_field_cat-coltext   = 'Purch. Group'.
  gs_field_cat-col_pos   = 2.
  APPEND gs_field_cat TO gt_field_cat.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'EKNAM'.
  gs_field_cat-coltext   = 'Purch. Group Desc.'.
  gs_field_cat-col_pos   = 3.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'LIFNR'.
  gs_field_cat-coltext   = 'Vendor'.
  gs_field_cat-col_pos   = 4.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'NAME1'.
  gs_field_cat-coltext   = 'Vendor Name'.
  gs_field_cat-col_pos   = 5.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'EBELN'.
  gs_field_cat-coltext   = 'Purchase Order'.
  gs_field_cat-col_pos   = 6.
  gs_field_cat-no_merging = 'X'.
  gs_field_cat-hotspot   = 'X'.
  gs_field_cat-tooltip   = 'DOUBLE CLICK THE CELL TO SEE DETAILS'.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'EBELP'.
  gs_field_cat-coltext   = 'Item Number'.
  gs_field_cat-col_pos   = 7.
  gs_field_cat-no_merging = 'X'.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'AEDAT'.
  gs_field_cat-coltext   = 'Order Date'.
  gs_field_cat-col_pos   = 8.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MATNR'.
  gs_field_cat-coltext   = 'Material Number'.
  gs_field_cat-col_pos   = 9.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'BISMT'.
  gs_field_cat-coltext   = 'Old Material Number'.
  gs_field_cat-col_pos   = 10.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'GROES'.
  gs_field_cat-coltext   = 'Standard 1'.
  gs_field_cat-col_pos   = 11.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MAKTX'.
  gs_field_cat-coltext   = 'Material Description'.
  gs_field_cat-col_pos   = 12.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'SLFDT'.
  gs_field_cat-coltext   = 'Delivery Date'.
  CASE 'X'.
    WHEN spo.
      gs_field_cat-key       = 'X'.
  ENDCASE.
  gs_field_cat-col_pos   = 13.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'BUDAT'.
  CASE 'X'.
    WHEN lb_gr OR i_gr_ir.
      gs_field_cat-key       = 'X'.
  ENDCASE.
  gs_field_cat-coltext   = 'GR Date'.
  gs_field_cat-col_pos   = 14.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MENGE_PO'.
  gs_field_cat-coltext   = 'Purchasing Quantity'.
  gs_field_cat-do_sum    = 'X'.
  gs_field_cat-datatype  = 'QUAN'.
  gs_field_cat-qfieldname = 'MEINS_PO'.
  gs_field_cat-col_pos   = 15.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MEINS_PO'.
  gs_field_cat-coltext   = 'Unit'.
  gs_field_cat-col_pos   = 16.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'NETPR'.
  gs_field_cat-coltext   = 'Purchasing Unit Price'.
  gs_field_cat-col_pos   = 17.
  APPEND gs_field_cat TO gt_field_cat.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'PEINH'.
  gs_field_cat-coltext   = 'Pricing Unit'.
  gs_field_cat-col_pos   = 18.
  APPEND gs_field_cat TO gt_field_cat.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'WAERS'.
  gs_field_cat-coltext   = 'Purchase Currency'.
  gs_field_cat-col_pos   = 19.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MENGE_GR'.
  gs_field_cat-coltext   = 'GR Quantity'.
  gs_field_cat-do_sum    = 'X'.
  gs_field_cat-datatype  = 'QUAN'.
  gs_field_cat-qfieldname = 'MEINS_GR'.
  gs_field_cat-col_pos   = 20.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MEINS_GR'.
  gs_field_cat-coltext   = 'Unit'.
  gs_field_cat-col_pos   = 21.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'NETPR_GR'.
  gs_field_cat-coltext   = 'GR Unit Price'.
  gs_field_cat-col_pos   = 22.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'WAERS_GR'.
  gs_field_cat-coltext   = 'GR Currency'.
  gs_field_cat-col_pos   = 23.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'WRBTR_GR'.
  gs_field_cat-coltext   = 'GR Amount'.
  gs_field_cat-do_sum    = 'X'.
  gs_field_cat-datatype  = 'CURR'.
  gs_field_cat-cfieldname = 'WAERS_GR'.
  gs_field_cat-col_pos   = 24.
  APPEND gs_field_cat TO gt_field_cat.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MBLNR'.
  gs_field_cat-coltext   = 'GR Document No.'.
  gs_field_cat-col_pos   = 25.
  APPEND gs_field_cat TO gt_field_cat.


  IF spo = 'X' OR i_gr_ir = 'X'.
    CLEAR gs_field_cat.
    gs_field_cat-fieldname = 'LIGHT'.
    gs_field_cat-coltext   = 'GR DOCUMENT COUNT'.
    gs_field_cat-col_pos   = 26.
    gs_field_cat-icon = 'X'.
    APPEND gs_field_cat TO gt_field_cat.
  ENDIF.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MENGE_IR'.
  gs_field_cat-coltext   = 'IR Quantity'.
  gs_field_cat-do_sum    = 'X'.
  gs_field_cat-datatype  = 'QUAN'.
  gs_field_cat-qfieldname = 'MEINS_IR'.
  gs_field_cat-col_pos   = 27.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'MEINS_IR'.
  gs_field_cat-coltext   = 'Unit'.
  gs_field_cat-col_pos   = 28.
  APPEND gs_field_cat TO gt_field_cat.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'WRBTR_IR'.
  gs_field_cat-coltext   = 'IR Amount'.
  gs_field_cat-do_sum    = 'X'.
  gs_field_cat-datatype  = 'CURR'.
  gs_field_cat-cfieldname = 'WAERS_IR'.
  gs_field_cat-col_pos   = 29.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'WAERS_IR'.
  gs_field_cat-coltext   = 'IR Currency'.
  gs_field_cat-col_pos   = 30.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'BELNR_IR'.
  gs_field_cat-coltext   = 'IV DOCUMENT NO.'.
  gs_field_cat-col_pos   = 31.
  APPEND gs_field_cat TO gt_field_cat.



  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'LIGHT2'.
  gs_field_cat-coltext   = 'IV DOCUMENT COUNT'.
  gs_field_cat-col_pos   = 32.
  gs_field_cat-icon = 'X'.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'GJAHR_IR'.
  gs_field_cat-coltext   = 'IR FISCAL YEAR.'.
  gs_field_cat-col_pos   = 33.
  APPEND gs_field_cat TO gt_field_cat.



  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'BSART'.
  gs_field_cat-coltext   = 'Document Type'.
  gs_field_cat-col_pos   = 34.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'XBLNR'.
  gs_field_cat-coltext   = 'Delivery Note'.
  gs_field_cat-col_pos   = 35.
  APPEND gs_field_cat TO gt_field_cat.


  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'VGABE'.
  gs_field_cat-coltext   = 'VGABE'.
  gs_field_cat-col_pos   = 36.
  APPEND gs_field_cat TO gt_field_cat.



  IF spo = 'X' OR i_gr_ir = 'X'.
    CLEAR gs_field_cat.
    gs_field_cat-fieldname = 'LIGHT3'.
    gs_field_cat-coltext   = 'Delivery Note COUNT'.
    gs_field_cat-col_pos   = 37.
    gs_field_cat-icon = 'X'.
    APPEND gs_field_cat TO gt_field_cat.
  ENDIF.

  CLEAR gs_field_cat.
  gs_field_cat-fieldname = 'GR_PRICE_P'.
  gs_field_cat-coltext   = 'GR Unit Price of a Piece'.
  gs_field_cat-do_sum    = 'X'.
  gs_field_cat-col_pos   = 38.
  APPEND gs_field_cat TO gt_field_cat.



  REFRESH gt_sort.

  CLEAR gs_sort.
  CASE 'X'.
    WHEN spo.
      gs_sort-fieldname = 'SLFDT'.
      gs_sort-up        = 'X'.
      gs_sort-subtot    = 'X'.

    WHEN lb_gr OR i_gr_ir.
      gs_sort-fieldname = 'BUDAT'.
      gs_sort-up        = 'X'.
      gs_sort-subtot    = 'X'.
  ENDCASE.
  APPEND gs_sort TO gt_sort.

  CLEAR gs_sort.
  gs_sort-fieldname = 'EBELN'.
  gs_sort-up        = 'X'. 
  APPEND gs_sort TO gt_sort.

  CLEAR gs_sort.
  gs_sort-fieldname = 'EBELP'.
  gs_sort-up        = 'X'.
  APPEND gs_sort TO gt_sort.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DATA_FIRST
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_data_first.
  PERFORM select_main_sub_data_first.
  PERFORM calculate_display_data_first.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GER_DATA_SECOND
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM ger_data_second.
  PERFORM select_main_sub_data_second.
  PERFORM calculate_display_data_second.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GER_DATA_THIRD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM ger_data_third.
  PERFORM select_main_sub_data_third.
  PERFORM calculate_display_data_third.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECT_MAIN_SUB_DATA_FIRST
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM select_main_sub_data_first .
  SELECT ekpo~ebeln ekpo~ebelp ekko~ekgrp ekko~lifnr ekko~aedat ekko~bsart ekko~waers
         ekpo~menge AS menge_po ekpo~meins AS meins_po ekpo~netpr AS netpr ekpo~peinh
         t024~eknam lf~name1 ekpo~txz01 AS groes ekpo~idnlf AS bismt b~maktx
   INTO CORRESPONDING FIELDS OF TABLE gt_display
   FROM ekko JOIN ekpo ON ekko~ebeln = ekpo~ebeln
   JOIN mara ON mara~matnr = ekpo~matnr
   JOIN makt AS b ON mara~matnr = b~matnr AND b~spras = lv_langu
   JOIN t024 ON ekko~ekgrp = t024~ekgrp
   JOIN lfa1 AS lf ON ekko~lifnr = lf~lifnr
    WHERE ekko~aedat IN s_po_dt   " PO 생성일
     AND  ekko~lifnr IN s_vendor    " 공급업체
     AND  ekko~ekgrp IN s_p_gp   " 구매 그룹
     AND  ekpo~matnr IN s_m_num   " 자재 번호
     AND  ekko~ebeln IN s_po_num    " 구매 오더 번호
     AND  ekpo~bednr IN s_trk_no  " 추적 번호
     AND  ekko~ekorg IN s_p_org     " 구매 조직
     AND  ekpo~werks IN s_plant    " 플랜트
     AND  ekko~bsart IN so_dc_tp.  " 문서 유형
*--------------------------------------------------------------------------------------*
  "ekbe
  SELECT ebeln ebelp menge xblnr wrbtr budat shkzg vgabe
   INTO CORRESPONDING FIELDS OF TABLE lt_ekbe
   FROM ekbe
   FOR ALL ENTRIES IN gt_display
   WHERE ebeln = gt_display-ebeln
    AND ebelp = gt_display-ebelp
    AND vgabe = '1'
    AND budat IN s_inv_dt.
  SORT lt_ekbe BY ebeln ebelp budat DESCENDING.

  "mseg
  SELECT ebeln ebelp matnr meins mblnr
   INTO CORRESPONDING FIELDS OF TABLE lt_mseg
   FROM mseg
   FOR ALL ENTRIES IN gt_display
   WHERE ebeln = gt_display-ebeln
    AND ebelp = gt_display-ebelp.
  SORT lt_mseg BY ebeln ebelp.

  "rseg
  SELECT rseg~ebeln rseg~ebelp rseg~menge
         rseg~meins rseg~wrbtr rseg~belnr rseg~gjahr
   INTO CORRESPONDING FIELDS OF TABLE lt_rseg
   FROM rseg INNER JOIN rbkp
   ON rseg~belnr = rbkp~belnr AND rseg~gjahr = rbkp~gjahr
   FOR ALL ENTRIES IN gt_display
   WHERE rseg~ebeln = gt_display-ebeln
    AND rseg~ebelp = gt_display-ebelp
    AND rbkp~budat IN s_inv_dt.
  SORT lt_rseg BY ebeln ebelp gjahr DESCENDING.

  "eket
  SELECT ebeln ebelp slfdt
   INTO CORRESPONDING FIELDS OF TABLE lt_eket
   FROM eket
   FOR ALL ENTRIES IN gt_display
   WHERE ebeln = gt_display-ebeln
    AND ebelp = gt_display-ebelp.
  SORT lt_eket BY ebeln ebelp slfdt DESCENDING.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CALCULATE_DISPLAY_DATA_FIRST
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM calculate_display_data_first .
  DATA: lv_gr_cnt TYPE i.
  DATA: lv_ir_cnt TYPE i.
  DATA: lv_dn_cnt TYPE i.
  DATA: lv_idx TYPE sy-tabix.

  LOOP AT gt_display INTO gs_display.

    gs_display-waers_gr = gs_display-waers.
    gs_display-waers_ir = gs_display-waers.
    gs_display-netpr_gr = gs_display-netpr.

    READ TABLE lt_ekbe
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH
               TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      lv_idx = sy-tabix.
      LOOP AT lt_ekbe INTO ls_ekbe FROM lv_idx.
        IF ls_ekbe-ebeln <> gs_display-ebeln OR ls_ekbe-ebelp <> gs_display-ebelp.
          EXIT.
        ENDIF.

        IF ls_ekbe-shkzg = 'H'.
          gs_display-menge_gr = gs_display-menge_gr - ls_ekbe-menge.
          gs_display-wrbtr_gr = gs_display-wrbtr_gr - ls_ekbe-wrbtr.
        ELSE.
          gs_display-menge_gr = gs_display-menge_gr + ls_ekbe-menge.
          gs_display-wrbtr_gr = gs_display-wrbtr_gr + ls_ekbe-wrbtr.
        ENDIF.
        gs_display-vgabe = ls_ekbe-vgabe.
        gs_display-xblnr = ls_ekbe-xblnr.
        gs_display-budat = ls_ekbe-budat.
        lv_gr_cnt = lv_gr_cnt + 1. 

        IF ls_ekbe-xblnr IS NOT INITIAL.
          lv_dn_cnt = lv_dn_cnt + 1.
        ENDIF.
      ENDLOOP.
    ENDIF.

    IF lv_gr_cnt > 1.
      gs_display-light = '@09@'.
    ELSEIF lv_gr_cnt = 1.
      gs_display-light = '@08@'. 
    ELSE.
      gs_display-light = '@0A@'.
    ENDIF.

    IF lv_dn_cnt > 1.
      gs_display-light3 = '@09@'. 
    ELSEIF lv_dn_cnt = 1.
      gs_display-light3 = '@08@'. 
    ELSE.
      gs_display-light3 = '@0A@'.
    ENDIF.

    READ TABLE lt_rseg INTO ls_rseg
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.

    IF sy-subrc = 0.
      lv_idx = sy-tabix.
      gs_display-gjahr_ir = ls_rseg-gjahr.   
      gs_display-belnr_ir = ls_rseg-belnr.

      LOOP AT lt_rseg INTO ls_rseg FROM lv_idx.
        IF ls_rseg-ebeln <> gs_display-ebeln OR ls_rseg-ebelp <> gs_display-ebelp.
          EXIT.
        ENDIF.
        gs_display-menge_ir = gs_display-menge_ir + ls_rseg-menge. 
        gs_display-wrbtr_ir = gs_display-wrbtr_ir + ls_rseg-wrbtr. 
        gs_display-meins_ir = ls_rseg-meins.
        lv_ir_cnt = lv_ir_cnt + 1.
      ENDLOOP.
    ENDIF.

    IF lv_ir_cnt > 1.
      gs_display-light2 = '@09@'. 
    ELSEIF lv_ir_cnt = 1.
      gs_display-light2 = '@08@'. 
    ELSE.
      gs_display-light2 = '@0A@'. 
    ENDIF.

    READ TABLE lt_mseg INTO ls_mseg
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.
    IF sy-subrc = 0.
      gs_display-matnr = ls_mseg-matnr.
      gs_display-meins_gr = ls_mseg-meins.
      gs_display-meins_ir = ls_mseg-meins.
      gs_display-mblnr = ls_mseg-mblnr.
    ENDIF.

    READ TABLE lt_eket INTO ls_eket
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.
    IF sy-subrc = 0.
      gs_display-slfdt = ls_eket-slfdt.
    ENDIF.

    IF gs_display-menge_gr <> 0.
      gs_display-gr_price_p = gs_display-wrbtr_gr / gs_display-menge_gr.
    ENDIF.

    MODIFY gt_display FROM gs_display.
    CLEAR: gs_display, lv_ir_cnt, lv_gr_cnt, lv_dn_cnt.

  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECT_MAIN_SUB_DATA_SECOND
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM select_main_sub_data_second .
  SELECT ekpo~ebeln ekpo~ebelp ekko~ekgrp ekko~lifnr ekko~aedat ekko~waers ekko~bsart
         ekpo~menge AS menge_po ekpo~meins AS meins_po ekpo~netpr AS netpr ekpo~peinh
         t024~eknam lf~name1 ekpo~txz01 AS groes ekpo~idnlf b~maktx
         ekbe~menge AS menge_gr ekbe~xblnr ekbe~wrbtr AS wrbtr_gr ekbe~budat ekbe~shkzg ekbe~vgabe ekbe~belnr
   INTO CORRESPONDING FIELDS OF TABLE gt_display
   FROM ekko JOIN ekpo ON ekko~ebeln = ekpo~ebeln
   JOIN mara AS a ON a~matnr = ekpo~matnr
   JOIN makt AS b ON a~matnr = b~matnr AND b~spras = lv_langu
   JOIN t024 ON ekko~ekgrp = t024~ekgrp
   JOIN lfa1 AS lf ON ekko~lifnr = lf~lifnr
   JOIN ekbe ON ekbe~ebeln = ekpo~ebeln AND ekbe~ebelp = ekpo~ebelp
   WHERE ekko~lifnr IN s_vendor AND  ekko~ekgrp IN s_p_gp
    AND  ekpo~matnr IN s_m_num  AND  ekko~ebeln IN s_po_num
    AND  ekpo~bednr IN s_trk_no AND  ekko~ekorg IN s_p_org
    AND  ekpo~werks IN s_plant  AND  ekko~bsart IN so_dc_tp
    AND  budat IN s_gr_dt       AND  vgabe = '1' .

  "mseg
  SELECT ebeln ebelp matnr meins mblnr
  INTO CORRESPONDING FIELDS OF TABLE lt_mseg
  FROM mseg
  FOR ALL ENTRIES IN gt_display
  WHERE ebeln = gt_display-ebeln
   AND ebelp = gt_display-ebelp
   AND mblnr = gt_display-belnr.
  SORT lt_mseg BY ebeln ebelp mblnr.

  "rseg
  SELECT rseg~ebeln rseg~ebelp rseg~menge
         rseg~meins rseg~wrbtr rseg~belnr rseg~gjahr
  INTO CORRESPONDING FIELDS OF TABLE lt_rseg
  FROM rseg INNER JOIN rbkp
  ON rseg~belnr = rbkp~belnr AND rseg~gjahr = rbkp~gjahr
  FOR ALL ENTRIES IN gt_display
  WHERE rseg~ebeln = gt_display-ebeln
   AND rseg~ebelp = gt_display-ebelp
   AND rbkp~budat IN s_inv_dt.
  SORT lt_rseg BY ebeln ebelp gjahr DESCENDING.

  "eket
  SELECT ebeln ebelp slfdt
  INTO CORRESPONDING FIELDS OF TABLE lt_eket
  FROM eket
  FOR ALL ENTRIES IN gt_display
  WHERE ebeln = gt_display-ebeln
   AND ebelp = gt_display-ebelp.
  SORT lt_eket BY ebeln ebelp.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CALCULATE_DISPLAY_DATA_SECOND
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM calculate_display_data_second .
  DATA: lv_idx TYPE sy-tabix.
  DATA: lv_gr_cnt TYPE i.
  DATA: lv_ir_cnt TYPE i.
  DATA: lv_dn_cnt TYPE i.

  LOOP AT gt_display INTO gs_display.

    gs_display-waers_gr = gs_display-waers.
    gs_display-waers_ir = gs_display-waers.
    gs_display-netpr_gr = gs_display-netpr.

    IF gs_display-shkzg = 'H'.
      gs_display-menge_gr = gs_display-menge_gr * -1.
      gs_display-wrbtr_gr = gs_display-wrbtr_gr * -1.
    ENDIF.

    READ TABLE lt_mseg INTO ls_mseg
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
              mblnr = gs_display-belnr
               BINARY SEARCH.

    IF sy-subrc = 0.
      gs_display-matnr = ls_mseg-matnr.
      gs_display-meins_gr = ls_mseg-meins.
      gs_display-meins_ir = ls_mseg-meins.
      gs_display-mblnr = ls_mseg-mblnr.
    ENDIF.

    READ TABLE lt_rseg INTO ls_rseg
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.

    IF sy-subrc = 0.
      lv_idx = sy-tabix.
      gs_display-gjahr_ir = ls_rseg-gjahr.
      gs_display-belnr_ir = ls_rseg-belnr.

      LOOP AT lt_rseg INTO ls_rseg FROM lv_idx.
        IF ls_rseg-ebeln <> gs_display-ebeln OR ls_rseg-ebelp <> gs_display-ebelp.
          EXIT.
        ENDIF.

        gs_display-menge_ir = gs_display-menge_ir + ls_rseg-menge. 
        gs_display-wrbtr_ir = gs_display-wrbtr_ir + ls_rseg-wrbtr.  
        gs_display-meins_ir = ls_rseg-meins.
        lv_ir_cnt = lv_ir_cnt + 1.
      ENDLOOP.
    ENDIF.

    IF lv_ir_cnt > 1.
      gs_display-light2 = '@09@'.
    ELSEIF lv_ir_cnt = 1.
      gs_display-light2 = '@08@'.
    ELSE.
      gs_display-light2 = '@0A@'.
    ENDIF.

    READ TABLE lt_eket INTO ls_eket
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.

    IF sy-subrc = 0.
      gs_display-slfdt = ls_eket-slfdt.
    ENDIF.

    IF gs_display-menge_gr <> 0.
      gs_display-gr_price_p = gs_display-wrbtr_gr / gs_display-menge_gr.
    ENDIF.

    MODIFY gt_display FROM gs_display.
    CLEAR: gs_display,lv_ir_cnt.

  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECT_MAIN_SUB_DATA_THIRD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM select_main_sub_data_third .
  SELECT ekpo~ebeln ekpo~ebelp ekko~ekgrp ekko~lifnr ekko~aedat ekko~waers ekko~bsart
           ekpo~menge AS menge_po ekpo~meins AS meins_po ekpo~netpr AS netpr ekpo~peinh
           t024~eknam lf~name1 ekpo~txz01 AS groes ekpo~idnlf AS bismt b~maktx
    INTO CORRESPONDING FIELDS OF TABLE gt_display
    FROM ekko JOIN ekpo ON ekko~ebeln = ekpo~ebeln
    JOIN mara AS a ON a~matnr = ekpo~matnr
    JOIN makt AS b ON a~matnr = b~matnr AND b~spras = lv_langu
    JOIN t024 ON ekko~ekgrp = t024~ekgrp
    JOIN lfa1 AS lf ON ekko~lifnr = lf~lifnr
    WHERE ekko~aedat IN s_po_dt  AND ekko~lifnr IN s_vendor
     AND ekko~ekgrp  IN s_p_gp   AND ekpo~matnr IN s_m_num
     AND ekko~ebeln  IN s_po_num AND ekpo~bednr IN s_trk_no
     AND ekko~ekorg  IN s_p_org  AND ekpo~werks IN s_plant
     AND ekko~bsart  IN so_dc_tp.

  "ekbe
  SELECT ebeln ebelp menge xblnr wrbtr budat shkzg vgabe
  INTO CORRESPONDING FIELDS OF TABLE lt_ekbe
  FROM ekbe
  FOR ALL ENTRIES IN gt_display
  WHERE ebeln = gt_display-ebeln AND ebelp = gt_display-ebelp
   AND vgabe IN ('1', '2') AND budat IN s_gr_dt.
  SORT lt_ekbe BY ebeln ebelp budat DESCENDING.

  "mseg
  SELECT ebeln ebelp matnr meins mblnr
  INTO CORRESPONDING FIELDS OF TABLE lt_mseg
  FROM mseg
  FOR ALL ENTRIES IN gt_display
  WHERE ebeln = gt_display-ebeln AND ebelp = gt_display-ebelp.
  SORT lt_mseg BY ebeln ebelp.

  "rseg
  SELECT rseg~ebeln rseg~ebelp rseg~menge
         rseg~meins rseg~wrbtr rseg~belnr rseg~gjahr
 INTO CORRESPONDING FIELDS OF TABLE lt_rseg
 FROM rseg INNER JOIN rbkp
 ON rseg~belnr = rbkp~belnr AND rseg~gjahr = rbkp~gjahr
 FOR ALL ENTRIES IN gt_display
 WHERE rseg~ebeln = gt_display-ebeln
 AND rseg~ebelp = gt_display-ebelp
 AND rbkp~budat IN s_inv_dt.
  SORT lt_rseg BY ebeln ebelp gjahr DESCENDING.

  "eket
  SELECT ebeln ebelp slfdt
  INTO CORRESPONDING FIELDS OF TABLE lt_eket
  FROM eket
  FOR ALL ENTRIES IN gt_display
  WHERE ebeln = gt_display-ebeln AND ebelp = gt_display-ebelp.
  SORT lt_eket BY ebeln ebelp slfdt DESCENDING.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CALCULATE_DISPLAY_DATA_THIRD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM calculate_display_data_third .
  DATA: lv_gr_total TYPE ekbe-menge,
        lv_ir_total TYPE ekbe-menge,
        lv_idx_gr   TYPE sy-tabix,
        lv_idx_ir   TYPE sy-tabix.
  DATA: lv_gr_cnt TYPE i.
  DATA: lv_ir_cnt TYPE i.
  DATA: lv_dn_cnt TYPE i.
  DATA: lv_loop_idx TYPE sy-tabix. 

  LOOP AT gt_display INTO gs_display.
    gs_display-waers_gr = gs_display-waers.
    gs_display-waers_ir = gs_display-waers.
    gs_display-netpr_gr = gs_display-netpr.
    lv_loop_idx = sy-tabix.

    READ TABLE lt_ekbe INTO ls_ekbe
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.
    IF sy-subrc = 0.
      lv_idx_gr = sy-tabix.
      gs_display-vgabe = ls_ekbe-vgabe.
      gs_display-xblnr = ls_ekbe-xblnr.
      gs_display-budat = ls_ekbe-budat.

      LOOP AT lt_ekbe INTO ls_ekbe FROM lv_idx_gr.
        IF ls_ekbe-ebeln <> gs_display-ebeln OR ls_ekbe-ebelp <> gs_display-ebelp.
          EXIT.
        ENDIF.

        IF ls_ekbe-shkzg = 'H'.
          gs_display-menge_gr = gs_display-menge_gr - ls_ekbe-menge.
          gs_display-wrbtr_gr = gs_display-wrbtr_gr - ls_ekbe-wrbtr.
        ELSE.
          gs_display-menge_gr = gs_display-menge_gr + ls_ekbe-menge.
          gs_display-wrbtr_gr = gs_display-wrbtr_gr + ls_ekbe-wrbtr.
        ENDIF.

        lv_gr_cnt = lv_gr_cnt + 1.
        IF ls_ekbe-xblnr IS NOT INITIAL.
          lv_dn_cnt = lv_dn_cnt + 1.
        ENDIF.

      ENDLOOP.
    ENDIF.

    IF lv_gr_cnt > 1.
      gs_display-light = '@09@'. 
    ELSEIF lv_gr_cnt = 1.
      gs_display-light = '@08@'. 
    ELSE.
      gs_display-light = '@0A@'. 
    ENDIF.

    IF lv_dn_cnt > 1.
      gs_display-light3 = '@09@'.
    ELSEIF lv_dn_cnt = 1.
      gs_display-light3 = '@08@'.
    ELSE.
      gs_display-light3 = '@0A@'.
    ENDIF.

    READ TABLE lt_rseg INTO ls_rseg
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.
    IF sy-subrc = 0.
      lv_idx_ir = sy-tabix.
      gs_display-gjahr_ir = ls_rseg-gjahr.
      gs_display-belnr_ir = ls_rseg-belnr.

      LOOP AT lt_rseg INTO ls_rseg FROM lv_idx_ir.
        IF ls_rseg-ebeln <> gs_display-ebeln OR ls_rseg-ebelp <> gs_display-ebelp.
          EXIT.
        ENDIF.

        gs_display-menge_ir = gs_display-menge_ir + ls_rseg-menge.
        gs_display-wrbtr_ir = gs_display-wrbtr_ir + ls_rseg-wrbtr.
        gs_display-meins_ir = ls_rseg-meins.
        lv_ir_cnt = lv_ir_cnt + 1.
      ENDLOOP.
    ENDIF.

    IF lv_ir_cnt > 1.
      gs_display-light2 = '@09@'.
    ELSEIF lv_ir_cnt = 1.
      gs_display-light2 = '@08@'.
    ELSE.
      gs_display-light2 = '@0A@'.
    ENDIF.

    IF gs_display-menge_gr = gs_display-menge_ir.
      DELETE gt_display INDEX lv_loop_idx.
      CONTINUE.
    ENDIF.

    READ TABLE lt_mseg INTO ls_mseg
     WITH KEY ebeln = gs_display-ebeln
              ebelp = gs_display-ebelp
               BINARY SEARCH.

    IF sy-subrc = 0.
      gs_display-matnr = ls_mseg-matnr.
      gs_display-meins_gr = ls_mseg-meins.
      gs_display-meins_ir = ls_mseg-meins.
      gs_display-mblnr = ls_mseg-mblnr.
    ENDIF.

    READ TABLE lt_eket INTO ls_eket
    WITH KEY ebeln = gs_display-ebeln
             ebelp = gs_display-ebelp
              BINARY SEARCH.

    IF sy-subrc = 0.
      gs_display-slfdt = ls_eket-slfdt.
    ENDIF.

    IF gs_display-menge_gr <> 0.
      gs_display-gr_price_p = gs_display-wrbtr_gr / gs_display-menge_gr.
    ENDIF.

    MODIFY gt_display FROM gs_display.
    CLEAR: gs_display, lv_gr_cnt, lv_dn_cnt, lv_ir_cnt.

  ENDLOOP.

ENDFORM.
