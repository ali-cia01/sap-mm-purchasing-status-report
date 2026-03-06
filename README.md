# 📦 [MM] Purchasing Status Report

> SAP MM Module | ABAP Report for integrated purchasing status tracking across PO → GR → IR

---

## 📌 Overview

An ABAP Report program that provides an **integrated view of the entire purchasing process** — from Purchase Order (PO) creation through Goods Receipt (GR) to Invoice Verification (IR) — all in a single screen.

Users can switch between **3 output layouts** via a Radio Checkbox on the selection screen to view data from different perspectives.

---

## 🔄 Purchasing Process Flow

```
Purchase Order  →  Goods Receipt  →  Invoice Verification
 EKKO / EKPO       MSEG / MKPF        EKBE / RSEG / BSEG
```

---

## 🖥️ Selection Screen

| No | Field | SAP Reference | Required |
|----|-------|---------------|----------|
| 01 | PO Creation Date / GR Date | EKKO-AEDAT / MKPF-BUDAT | ✅ |
| 02 | Vendor | EKKO-LIFNR | |
| 03 | Purchasing Group | EKKO-EKGRP | |
| 04 | Material Number | MSEG-MATNR | |
| 05 | Purchase Order | EKKO-EBELN | |
| 06 | Tracking Number | EKPO-BEDNR | |
| 07 | Purchasing Organization | EKKO-EKORG | |
| 08 | Plant | EKPO-WERKS | ✅ |
| 09 | Issued Date of Tax Invoice | EKBE-BUDAT | |
| 10 | Purchasing Document Type | EKKO-BSART | |

> ⚠️ **Field 01 (Date)** changes dynamically based on the selected Layout.  
> `Sum by Purchase Order` → **PO Creation Date** / `List by GR Date`, `Incompleted GR & IR` → **GR Date**

---

## 📊 Output Layouts (3 Types)

### ① Sum by Purchase Order
- Aggregated view grouped by Purchase Order
- Sorted by Delivery Date in **ascending order**
- Displays **Subtotal** per Delivery Date and **Grand Total**
- Aggregated fields: PO Qty / GR Qty / GR Amount / IR Qty / IR Amount

### ② List by GR Date
- Line-item list sorted by Goods Receipt Date
- Sorted by GR Date in **ascending order**
- Displays **Subtotal** per GR Date and **Grand Total**

### ③ Incompleted GR & IR
- Shows documents where GR or IR processing is **not yet completed**
- Sorted by GR Date
- Used for tracking and monitoring outstanding purchasing documents

---

## 📋 Output Fields (31 Fields)

<details>
<summary>View all fields</summary>

| No | Field | SAP Reference | Description |
|----|-------|---------------|-------------|
| 01 | Purch. Group | EKKO-EKGRP | Purchasing Group |
| 02 | Purch. Group Desc. | T024-EKNAM | Purchasing Group Name |
| 03 | Vendor | EKKO-LIFNR | Vendor Code |
| 04 | Vendor Name | LFA1-NAME1 | Vendor Name |
| 05 | Purchase Order | MSEG-EBELN | PO Number ⭐ |
| 06 | Item Number | MSEG-EBELP | PO Line Item |
| 07 | Order Date | EKKO-AEDAT | PO Creation Date |
| 08 | Material Number | MSEG-MATNR | Material Number |
| 09 | Old Material Number | MARA-GROES | Legacy Material Number |
| 10 | Standard 1 | MARA-WRKST | Material Spec |
| 11 | Material Description | MAKT-MAKTX | Material Description |
| 12 | Delivery Date | EKET-SLFDT | Scheduled Delivery Date |
| 13 | GR Date | MKPF-BUDAT | Goods Receipt Date |
| 14 | Purchasing Quantity | EKPO-MENGE | Ordered Quantity |
| 15 | Unit | EKPO-MEINS | Unit of Measure |
| 16 | Purchasing Unit Price | EKPO-NETPR | Net Price per Unit |
| 17 | Pricing Unit | EKPO-PEINH | Price Unit |
| 18 | Purchase Currency | EKKO-WAERS | PO Currency |
| 19 | GR Quantity | EKBE-MENGE | Received Quantity |
| 20 | Unit | MSEG-MEINS | GR Unit of Measure |
| 21 | GR Unit Price | EKPO-NETPR | GR Unit Price |
| 22 | GR Currency | EKKO-WAERS | GR Currency |
| 23 | GR Amount | BSEG-WRBTR | GR Total Amount |
| 24 | GR Document No. | MSEG-MBLNR | Material Document Number |
| 25 | IR Quantity | RSEG-MENGE | Invoiced Quantity |
| 26 | Unit | RSEG-MEINS | IR Unit of Measure |
| 27 | IR Amount | RSEG-WRBTR | Invoice Amount |
| 28 | IR Currency | EKKO-WAERS | IR Currency |
| 29 | Document Type | EKKO-BSART | PO Document Type |
| 30 | Delivery Note | EKBE-XBLNR | Reference Document |
| 31 | GR Unit Price of a Piece | N/A (calculated) | Unit price per single piece |

> ⭐ **Purchase Order field**: Double-click triggers `Call Transaction 'ME23N'` (Double Click Event)  
> **GR Unit Price of a Piece** = Purchasing Unit Price ÷ Pricing Unit (calculated field)

</details>

---

## ⚙️ Technical Implementation

### 1. Dynamic Field Based on Layout
Field 01 on the selection screen changes dynamically depending on the selected Radio Checkbox.
```
● Sum by Purchase Order  →  PO Creation Date (EKKO-AEDAT)
● List by GR Date        →  GR Date (MKPF-BUDAT)
● Incompleted GR & IR    →  GR Date (MKPF-BUDAT)
```

### 2. Double Click Event (ME23N Navigation)
A double-click on the **Purchase Order** field in the ALV grid calls transaction `ME23N`, navigating the user directly to the PO detail screen.
```abap
" Double click event handler
CALL TRANSACTION 'ME23N'.
```

### 3. SHKZG Handling (Return / Cancellation)
```abap
" EKBE-SHKZG = 'H' indicates stock decrease (return or cancellation)
" Apply negative sign to GR Quantity and GR Amount
IF lv_shkzg = 'H'.
  lv_menge = lv_menge * -1.
ENDIF.
```

### 4. Subtotal / Grand Total Aggregation
Calculates subtotals and grand totals grouped by the date field of each layout.
- Aggregated fields: PO Qty, GR Qty, GR Amount, IR Qty, IR Amount
- Sorted in ascending order by date, then summed per group

### 5. Additional Notes
```abap
" Multi-language support
WHERE t023t-spras = sy-langu

" Distinguish GR from IR in purchase order history
" EKBE-VGABE = '1'  →  Goods Receipt
" EKBE-VGABE = '2'  →  Invoice Receipt
```

---

## 🗂️ SAP Tables Referenced

| Table | Description | Key Fields |
|-------|-------------|------------|
| EKKO | PO Header | EBELN, LIFNR, EKGRP, BSART, WAERS |
| EKPO | PO Line Item | EBELP, MATNR, WERKS, MENGE, NETPR, PEINH |
| MSEG | Material Document Segment | MBLNR, MATNR, EBELN, EBELP, MENGE |
| MKPF | Material Document Header | MBLNR, BUDAT |
| EKBE | PO History | EBELN, EBELP, VGABE, MENGE, BUDAT, SHKZG, XBLNR |
| RSEG | Invoice Document Item | BELNR, MATNR, EBELN, MENGE, WRBTR |
| BSEG | Accounting Document Segment | BELNR, WRBTR |
| LFA1 | Vendor Master | LIFNR, NAME1 |
| MARA | Material Master (General) | MATNR, GROES, WRKST |
| MAKT | Material Description | MATNR, MAKTX |
| T024 | Purchasing Groups | EKGRP, EKNAM |
| EKET | Delivery Schedule | EBELN, EBELP, SLFDT |

---

## 🛠️ Development Environment

| Item | Details |
|------|---------|
| SAP Module | MM (Materials Management) |
| Language | ABAP |
| Screen Type | Selection Screen + ALV Grid |
| ALV Type | `CL_GUI_ALV_GRID` |
| Output Layouts | 3 (Radio Checkbox) |

---

*Developed using SAP standard tables only — no custom tables involved.*
