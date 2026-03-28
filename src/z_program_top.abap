*&---------------------------------------------------------------------*
*&  Include           ZBC427_MMEXERCISE_04_TOP
*&---------------------------------------------------------------------*

TYPE-POOLS: icon.
TABLES: sscrfields.
TABLES: ekbe, mseg, eket, mkpf, mara, makt, ekpo, ekko.
DATA: lv_langu TYPE sy-langu.
lv_langu = sy-langu.

DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_grid      TYPE REF TO cl_gui_alv_grid.
DATA: gs_layout    TYPE lvc_s_layo,
      gt_field_cat TYPE lvc_t_fcat,
      gs_field_cat TYPE lvc_s_fcat.

DATA: gt_sort TYPE lvc_t_sort,
      gs_sort TYPE lvc_s_sort.

DATA: ok_code TYPE sy-ucomm.

DATA: lt_ekbe     TYPE TABLE OF ekbe,
      ls_ekbe     TYPE ekbe,
      lt_mseg     TYPE TABLE OF mseg,
      ls_mseg     TYPE mseg,
      lt_rseg     TYPE TABLE OF rseg,
      ls_rseg     TYPE rseg,
      lt_eket     TYPE TABLE OF eket,
      ls_eket     TYPE eket,
      lt_mkpf     TYPE TABLE OF mkpf,
      ls_mkpf     TYPE mkpf,
      lt_mara     TYPE TABLE OF mara,
      ls_mara     TYPE mara,
      lt_makt     TYPE TABLE OF makt,
      ls_makt     TYPE makt.

SELECTION-SCREEN BEGIN OF BLOCK condition WITH FRAME TITLE text-001.

SELECT-OPTIONS: s_po_dt FOR ekko-aedat MODIF ID po.
SELECT-OPTIONS: s_gr_dt FOR  mkpf-budat MODIF ID gr.
"OBLIGATORY
SELECT-OPTIONS: s_vendor FOR ekko-lifnr .
* 2. Purchasing Group (구매 그룹)
SELECT-OPTIONS: s_p_gp  FOR ekko-ekgrp.
* 3. Material Number (자재 번호)
SELECT-OPTIONS: s_m_num  FOR ekpo-matnr.
* 4. Purchase Order (구매 오더 번호)
SELECT-OPTIONS: s_po_num   FOR ekko-ebeln.
* 5. Tracking Number (추적 번호)
SELECT-OPTIONS: s_trk_no FOR ekpo-bednr.
* 6. Purchasing Organization (구매 조직)
SELECT-OPTIONS: s_p_org    FOR ekko-ekorg.
* 7. Plant (플랜트) OBLIGATORY
SELECT-OPTIONS: s_plant FOR  ekpo-werks MODIF ID obl NO INTERVALS.
* 8. Issued Date of Tax Invoice (송장 증빙일 등 날짜)
SELECT-OPTIONS: s_inv_dt FOR ekbe-budat.
* 9. Purchasing Document Type (구매 문서 유형)
SELECT-OPTIONS: so_dc_tp FOR ekko-bsart.

SELECTION-SCREEN END OF BLOCK condition.

SELECTION-SCREEN BEGIN OF BLOCK layout WITH FRAME TITLE text-002.

PARAMETERS: spo     RADIOBUTTON GROUP rbg1 DEFAULT 'X' USER-COMMAND rad,
            lb_gr   RADIOBUTTON GROUP rbg1,
            i_gr_ir RADIOBUTTON GROUP rbg1.

SELECTION-SCREEN END OF BLOCK layout.

*&---------------------------------------------------------------------*
*& 상세화면 필드 내역 (31개 필드 일치)
*&---------------------------------------------------------------------*
TYPES: BEGIN OF ty_data,
         "extra
         light      TYPE c LENGTH 4,
         light2     TYPE c LENGTH 4,
         light3     TYPE c LENGTH 4,
         belnr      TYPE ekbe-belnr,
         shkzg      TYPE ekbe-shkzg,
         " 1~5번
         ekgrp      TYPE ekko-ekgrp,      " Purch. Group
         eknam      TYPE t024-eknam,      " Purch. Group Desc.
         lifnr      TYPE ekko-lifnr,      " Vendor
         name1      TYPE lfa1-name1,      " Vendor Name
         ebeln      TYPE mseg-ebeln,      " Purchase Order

         " 6~10번
         ebelp      TYPE mseg-ebelp,      " Item Number
         aedat      TYPE ekko-aedat,      " Order Date
         matnr      TYPE mseg-matnr,      " Material Number
         bismt      TYPE ekpo-idnlf,      " Old Material Number
         groes      TYPE ekpo-txz01,      " Standard 1

         " 11~15번
         maktx      TYPE makt-maktx,      " Material Description
         slfdt      TYPE eket-slfdt,      " Delivery Date
         budat      TYPE mkpf-budat,      " GR Date
         menge_po   TYPE ekpo-menge,      " Purchasing Quantity
         meins_po   TYPE ekpo-meins,      " Unit

         " 16~20번
         netpr      TYPE ekpo-netpr,      " Purchasing Unit Price
         peinh      TYPE ekpo-peinh,      " Pricing Unit
         waers      TYPE ekko-waers,      " Purchase Currency
         menge_gr   TYPE p DECIMALS 2,      " GR Quantity
         meins_gr   TYPE mseg-meins,      " Unit

         " 21~25번
         netpr_gr   TYPE ekpo-netpr,      " GR Unit Price
         waers_gr   TYPE mseg-waers,      " GR Currency
         wrbtr_gr   TYPE p DECIMALS 2,      " GR Amount
         mblnr      TYPE mseg-mblnr,      " GR Document No.
         menge_ir   TYPE p DECIMALS 2,      " IR Quantity

         " 26~31번
         meins_ir   TYPE rseg-meins,      " Unit
         wrbtr_ir   TYPE p DECIMALS 2,    " IR Amount
         waers_ir   TYPE ekko-waers,      " IR Currency
         bsart      TYPE ekko-bsart,      " Document Type
         xblnr      TYPE ekbe-xblnr,      " Delivery Note
         vgabe      TYPE ekbe-vgabe,
                                          " extra 회계 문서 및 회계년도
         belnr_ir   TYPE rseg-belnr,      " IV Document No. (송장 문서 번호)
         gjahr_ir   TYPE rseg-gjahr,      " Fiscal Year (회계 연도)

         gr_price_p TYPE p DECIMALS 2,    " GR Unit Price of a Piece (N/A -> 계산 필드용)
       END OF ty_data.

DATA: gt_display TYPE TABLE OF ty_data,
      gs_display TYPE ty_data.
