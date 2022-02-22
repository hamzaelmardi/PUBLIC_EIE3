package com.EIE.demo.web;

import com.itextpdf.text.pdf.PdfContentByte;

public class DashedLine implements LineDash{
    public void applyLineDash(PdfContentByte canvas) {
        canvas.setLineDash(3, 3);
    }
}
