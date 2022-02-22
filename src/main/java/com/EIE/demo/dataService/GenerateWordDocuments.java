package com.EIE.demo.dataService;



import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;
import org.apache.poi.xwpf.usermodel.Borders;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.UnderlinePatterns;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFHeader;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFPicture;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTPPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSectPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSpacing;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STLineSpacingRule;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STOnOff;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;
import org.springframework.beans.factory.annotation.Value;

import com.EIE.demo.model.Installation;
import com.EIE.demo.model.Notification;
import com.google.zxing.WriterException;

public class GenerateWordDocuments {


    @Value("${url}")
    private static String urlRest;
    private final static String url=urlRest;


    public enum TextOrientation {
        LTR,
        RTL
    }

    public static String convertDate(String type,Date date) {
        String strDate="";
        if(date==null) {

        }else {


            SimpleDateFormat formatter = new SimpleDateFormat(type);
            strDate = formatter.format(date);

        }
        return strDate;
    }
    private static void setOrientation(XWPFParagraph par, TextOrientation orientation) {
        if ( par.getCTP().getPPr()==null ) {
            par.getCTP().addNewPPr();
        }
        if ( par.getCTP().getPPr().getBidi()==null ) {
            par.getCTP().getPPr().addNewBidi();
        }
        par.getCTP().getPPr().getBidi().setVal(orientation==TextOrientation.RTL? STOnOff.ON:STOnOff.OFF);
    }

    public static void setSingleLineSpacing(XWPFParagraph para) {
        CTPPr ppr = para.getCTP().getPPr();
        if (ppr == null) ppr = para.getCTP().addNewPPr();
        CTSpacing spacing = ppr.isSetSpacing()? ppr.getSpacing() : ppr.addNewSpacing();
        spacing.setAfter(BigInteger.valueOf(0));
        spacing.setBefore(BigInteger.valueOf(0));
        spacing.setLineRule(STLineSpacingRule.AUTO);
        spacing.setLine(BigInteger.valueOf(240));
    }

    //
    public static ByteArrayInputStream generateInvitationWord(String date_reunion,String nom_comite,String num_demande) throws IOException, InvalidFormatException, URISyntaxException {
        //init document
        XWPFDocument document= new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        //Add new Paragraph to  document
        XWPFParagraph ilaParaghraph = document.createParagraph();
        XWPFRun runIla = ilaParaghraph.createRun() ;

        runIla.setBold(true);
        runIla.setText("إلــى");
        runIla.setFontSize(18);
        ilaParaghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(ilaParaghraph,TextOrientation.RTL);

        //Add new Paragraph to  document
        XWPFParagraph destParaghraph = document.createParagraph();
        XWPFRun rundest = destParaghraph.createRun() ;

        rundest.setBold(true);
        rundest.setText(nom_comite);
        rundest.setFontSize(18);
        rundest.setFontFamily("Times New Roman");
        rundest.addBreak();
        rundest.addBreak();
        destParaghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(destParaghraph,TextOrientation.RTL);

        //Add new Paragraph to  document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun() ;
        XWPFRun run0_1 = paragraph0.createRun() ;

        run0.setBold(true);
        run0.setUnderline(UnderlinePatterns.SINGLE);
        run0.setText("الموضوع :");
        run0.setFontSize(16);
        run0.setFontFamily("Times New Roman");

        run0_1.setText(" انعقاد اجتماع اللجنة الوطنية لدراسات التأثير على البيئة.");
        run0_1.setFontSize(16);
        run0_1.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph0,TextOrientation.RTL);

        //Add new Paragraph to  document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun() ;
        XWPFRun run1_1 = paragraph1.createRun() ;

        run1.setBold(true);
        run1.setUnderline(UnderlinePatterns.SINGLE);
        run1.setText("المرفقات :");
        run1.setFontSize(16);
        run1.setFontFamily("Times New Roman");

        run1_1.setText(" دراسة التأثير على البيئة.");
        run1_1.setFontSize(16);
        run1_1.addBreak();
        run1_1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph1,TextOrientation.RTL);

        //Add new Paragraph to  document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2 = paragraph2.createRun() ;

        run2.setText("سلام تام بوجود مولانا الإمام، وبعد،");
        run2.setFontSize(14);
        run2.addBreak();
        run2.addBreak();
        run2.addBreak();
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2,TextOrientation.RTL);


        //Add new Paragraph to  document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun() ;

        run3.setText("\t طبقا لمقتضيات القانون" +
                " 12.03 " +
                "المتعلق بدراسات التأثير على البيئة ومرسومه" +
                " التطبيقي رقم 2.04.563 المتعلق باختصاصات وسير اللجنة الوطنية" +
                " واللجان الجهوية لدراسات التأثير على البيئة خاصة المادة 8، يشرفني أن أدعوكم" +
                " لإرسال من يمثلــكم في أشغال اللجنـــة الوطنية التــي ستعــقد اجتمــاعـــا يوم ");
        run3.setText(date_reunion);
        run3.setText(" بمقر هذه الوزارة.");
        run3.setFontSize(14);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.BOTH);
        setSingleLineSpacing(paragraph3);
        setOrientation(paragraph3,TextOrientation.RTL);

        //Add new Paragraph to  document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun() ;

        run4.setText("ويتضمن جدول أعمال هذا الاجتماع دراسة المشروع التالي: ");
        run4.setFontSize(14);
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4,TextOrientation.RTL);

//        Add new Paragraph44 to  document this is the paragraphe of infos about ijtima3
        XWPFParagraph paragraph44 = document.createParagraph();
        XWPFRun run44 = paragraph44.createRun() ;

        run44.setText("\u00A0"+num_demande+"\u00A0");
        run44.setFontSize(18);
        run44.setBold(true);
        run44.setFontFamily("Times New Roman");
        paragraph44.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4,TextOrientation.RTL);


        //Add new Paragraph to  document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun() ;

        run5.addBreak();
        run5.addBreak();
        run5.addBreak();
        run5.addBreak();
        run5.setText("وتفضلوا بقبول خالص التحيات والسلام.");
        run5.setFontSize(14);
        paragraph5.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph5,TextOrientation.RTL);
//=====================================================================================================
        //=========================================
        //header & Footer

        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null) headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);

        XWPFParagraph px=header.getParagraphArray(0);
        XWPFRun runx=px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(455), Units.toEMU(100));

        String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);

        //=========================================
//=====================================================================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }

    //
    public static ByteArrayInputStream generateRecuDepoNotification(Notification notification) throws IOException, InvalidFormatException, URISyntaxException {
        XWPFDocument document= new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        if (notification != null ) {
            XWPFTable table = document.createTable(7,1);
            table.getRow(0).getCell(0).removeParagraph(0);
            table.getRow(1).getCell(0).removeParagraph(0);
            table.getRow(2).getCell(0).removeParagraph(0);
            table.getRow(3).getCell(0).removeParagraph(0);
            table.getRow(4).getCell(0).removeParagraph(0);
            table.getRow(5).getCell(0).removeParagraph(0);
            table.getRow(6).getCell(0).removeParagraph(0);

            CTTblWidth width = table.getCTTbl().addNewTblPr().addNewTblW();
            width.setType(STTblWidth.DXA);
            width.setW(BigInteger.valueOf(9989));

            table.setCellMargins(200, 500, 0, 500);

            XWPFParagraph paragraph0 = table.getRow(0).getCell(0).addParagraph();
            XWPFRun run0 = paragraph0.createRun() ;
            run0.setBold(true);
            if(notification.getClassification().getId_classification()==2) {
				run0.setText("طلب الترخيص باستيراد النفايات  غير الخطرة ");
			}
			
			if(notification.getClassification().getId_classification()==1) {
				run0.setText("طلب الترخيص باستيراد النفايات  الخطرة ");
			}
           
            run0.setFontSize(14);
            run0.setFontFamily("Times New Roman");
            paragraph0.setAlignment(ParagraphAlignment.CENTER);
            setOrientation(paragraph0,TextOrientation.RTL);



            XWPFParagraph paragraph1 = table.getRow(1).getCell(0).addParagraph();
            XWPFRun run1 = paragraph1.createRun() ;
            run1.setBold(true);
            run1.setText("معلومات عن الشركة صاحبة الطلب ");
            run1.setFontSize(14);
            run1.setFontFamily("Times New Roman");
            paragraph1.setAlignment(ParagraphAlignment.CENTER);
            setOrientation(paragraph1,TextOrientation.RTL);

            String nom_emtrp = "";
            String adresse = "";
            String represent_entreprise = "";
            String telephone = "";
            String fax = "";
            String email = "";

            if(notification.getImportateur() != null){
                nom_emtrp = notification.getImportateur().getNom_fr();
                adresse = notification.getImportateur().getAdresse_fr();
                represent_entreprise = notification.getImportateur().getContact_fr();
                telephone = notification.getImportateur().getTel();
                fax = notification.getImportateur().getFax();
                email = notification.getImportateur().getMail();
            }

            XWPFParagraph paragraph2 = table.getRow(2).getCell(0).addParagraph();
            XWPFRun run2 = paragraph2.createRun() ;
            run2.setText("اسم الشركة ");
            run2.setText("  ");

            String nom_entreprise = nom_emtrp;
            run2.setText(nom_entreprise);
            run2.addBreak();

            run2.setText("العنوان ");
            run2.setText("  ");



            run2.setText(adresse);
            run2.addBreak();

            run2.setText("ممثل الشركة ");
            run2.setText("  ");



            run2.setText(represent_entreprise);
            run2.addBreak();

            run2.setText("الهاتف / الفاكس ");
            run2.setText("  ");

            run2.setText(telephone +" / "+ fax);
            run2.addBreak();

            run2.setText("البريد الإلكتروني ");
            run2.setText(" ");
            run2.setText(email);
            run2.addBreak();

            run2.setFontSize(14);
            run2.setFontFamily("Times New Roman");
            paragraph2.setAlignment(ParagraphAlignment.LEFT);
            setOrientation(paragraph2,TextOrientation.RTL);



            XWPFParagraph paragraph3 = table.getRow(3).getCell(0).addParagraph();
            XWPFRun run3 = paragraph3.createRun() ;
            run3.setBold(true);
            run3.setText("المعلومات الخاصة بالنفايات المستوردة ");
            run3.setFontSize(14);
            run3.setFontFamily("Times New Roman");
            paragraph3.setAlignment(ParagraphAlignment.CENTER);
            setOrientation(paragraph3,TextOrientation.RTL);


            XWPFParagraph paragraph4 = table.getRow(4).getCell(0).addParagraph();
            XWPFRun run4 = paragraph4.createRun() ;
            run4.setText("اخطار رقم ");
            run4.setText("  ");
            String num_notification = notification.getNum_notification()!=null?notification.getNum_notification():"";
            run4.setText(num_notification);
            run4.addBreak();

            run4.setText("النوع ");
            run4.setText("  ");

            String code_ar="";
            if(notification.getCode()!=null && notification.getCode().getNom_ar()!=null){
                code_ar = notification.getCode().getNom_ar();
            }
            run4.setText(code_ar);

            run4.addBreak();

            run4.setText("المصدر ");
            run4.setText("  ");
            run4.setText(notification.getProducteur_text());

            run4.addBreak();

            run4.setText("الرمز المصنف المغربي للنفايات  ");
            run4.setText("  ");

            run4.setText(notification.getCode()!=null?notification.getCode().getNom_fr():"");

            run4.addBreak();

            run4.setText("الكمية ");
            run4.setText("  ");
            String value = "";
            if( notification.getUnite() !=null)
                value = notification.getQuantite()+" "+ notification.getUnite().getNom_fr();
            else
                value = notification.getQuantite();
            run4.setText(value);
            run4.addBreak();

            run4.setFontSize(14);
            run4.setFontFamily("Times New Roman");
            paragraph4.setAlignment(ParagraphAlignment.LEFT);
            setOrientation(paragraph4,TextOrientation.RTL);


            XWPFParagraph paragraph5 = table.getRow(5).getCell(0).addParagraph();
            XWPFRun run5 = paragraph5.createRun() ;
            run5.setBold(true);
            run5.setText("وصل الإيداع ");
            run5.setFontSize(14);
            run5.setFontFamily("Times New Roman");
            paragraph5.setAlignment(ParagraphAlignment.CENTER);
            setOrientation(paragraph5,TextOrientation.RTL);

            //create sixth row



            XWPFParagraph paragraph6 = table.getRow(6).getCell(0).addParagraph();
            XWPFRun run6 = paragraph6.createRun() ;

            run6.setText("اسم الشركة ");
            run6.setText("  ");
            String username = "";
            String contact = "";
            if(notification.getImportateur()!=null){
                username = notification.getImportateur().getNom_fr();
                contact = notification.getImportateur().getContact_fr();
            }

            run6.setText(username);
            run6.addBreak();

            run6.setText("اسم وصفة مودع الطلب ");
            run6.setText("  ");
            run6.setText(contact);
            run6.addBreak();

            run6.setText("تاريخ الإيداع ");
            run6.addTab();
            String dateTest=convertDate("dd/MM/yyyy",notification.getDateDepot());

            run6.setText(dateTest);
            run6.addBreak();

            run6.setText("رقم الطلب ");
            run6.setText("  ");
            run6.setText(num_notification);


            XWPFParagraph paragraph66 = table.getRow(6).getCell(0).addParagraph();
            XWPFRun run66 = paragraph66.createRun() ;
            //        run66.setText(" خاتم مكتب الضبط ");
            //        run66.setBold(true);
            //        run66.setFontSize(16);
            //        run66.addBreak();
            //        run66.addBreak();
            //        run66.addBreak();
            //        run66.addBreak();

            //========================= ajouter le Qr CodePour
            //Generate The Qr Code With Numero notification
            try {
                byte[] bs=QRCodeGenerator.getQRCodeImage("check this link : http://localhost:85/downloadRecuDepo/"+notification.getId_notification()+"\n Numero de notification : "+ num_notification,300,300);
                run66.addPicture(new ByteArrayInputStream(bs),
                        XWPFDocument.PICTURE_TYPE_PNG,"Qrlogo",
                        Units.toEMU(60), Units.toEMU(60));
                setOrientation(paragraph66, TextOrientation.LTR);
                paragraph66.setAlignment(ParagraphAlignment.LEFT);
            } catch (WriterException e) {
                e.printStackTrace();
            }
            //========================================================

            XWPFParagraph paragraph6_1 = table.getRow(6).getCell(0).addParagraph();
            XWPFRun run666 = paragraph6_1.createRun() ;
            run666.setColor("4a37f0");
            run666.setFontSize(12);
            run666.setUnderline(UnderlinePatterns.SINGLE);
            run666.setText(url+"/downloadRecuDepo/"+notification.getId_notification());
            paragraph6_1.setAlignment(ParagraphAlignment.LEFT);

            run6.setFontSize(14);
            run6.setFontFamily("Times New Roman");
            paragraph6.setAlignment(ParagraphAlignment.LEFT);
            setOrientation(paragraph6,TextOrientation.RTL);
            //=========================================================================================================================
            //header & Footer

            XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
            if (headerFooterPolicy == null) headerFooterPolicy = document.createHeaderFooterPolicy();

            XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);

            XWPFParagraph px=header.getParagraphArray(0);
            XWPFRun runx=px.createRun();

            String logo = "/word_header.png";
            Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
            XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                    XWPFDocument.PICTURE_TYPE_PNG,logo,
                    Units.toEMU(495), Units.toEMU(100));

            String blip = header.getRelationId(header.getAllPackagePictures().get(0));
            picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
            setOrientation(px, TextOrientation.LTR);
            px.setAlignment(ParagraphAlignment.CENTER);

            //=========================================================================================================================
        }



        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());
    }

    //
    public static ByteArrayInputStream generateRecuAutorisation(Notification nt) throws IOException, InvalidFormatException, URISyntaxException {
        XWPFDocument document= new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        XWPFTable table = document.createTable(11,1);
        table.getRow(0).getCell(0).removeParagraph(0);
        table.getRow(1).getCell(0).removeParagraph(0);
        table.getRow(2).getCell(0).removeParagraph(0);
        table.getRow(3).getCell(0).removeParagraph(0);
        table.getRow(4).getCell(0).removeParagraph(0);
        table.getRow(5).getCell(0).removeParagraph(0);
        table.getRow(6).getCell(0).removeParagraph(0);

        table.getRow(7).getCell(0).removeParagraph(0);
        table.getRow(8).getCell(0).removeParagraph(0);
        table.getRow(9).getCell(0).removeParagraph(0);
        table.getRow(10).getCell(0).removeParagraph(0);

        CTTblWidth width = table.getCTTbl().addNewTblPr().addNewTblW();
        width.setType(STTblWidth.DXA);
        width.setW(BigInteger.valueOf(9090));

        table.setCellMargins(20, 0, 0, 200);

        XWPFParagraph paragraph0 = table.getRow(0).getCell(0).addParagraph();
        XWPFRun run0 = paragraph0.createRun() ;
        run0.setBold(true);
        run0.setText("الترخيص باستيراد النفايات الخطرة الناتجة عن أنشطة مناطق التصدير الحرة ");
        run0.setFontSize(14);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0,TextOrientation.RTL);



        XWPFParagraph paragraph1 = table.getRow(1).getCell(0).addParagraph();
        XWPFRun run1 = paragraph1.createRun() ;
        run1.setBold(true);
        run1.setText("المعلومات المتعلقة بالشركة ");
        run1.setFontSize(14);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1,TextOrientation.RTL);


        XWPFParagraph paragraph2 = table.getRow(2).getCell(0).addParagraph();
        XWPFRun run2 = paragraph2.createRun() ;
        run2.setText("اسم الشركة ");
        run2.setText("  ");
        run2.setText( nt.getImportateur().getNom_fr());
        run2.addBreak();

        run2.setText("العنوان ");
        run2.setText("  ");
        run2.setText( nt.getImportateur().getAdresse_fr() );
        run2.addBreak();

        run2.setText("الهاتف / الفاكس ");
        run2.setText("  ");
        run2.setText( nt.getImportateur().getFax()+" / "+ nt.getImportateur().getTel() );
        run2.addBreak();

        run2.setText("البريد الإلكتروني ");
        run2.setText(" ");
        run2.setText( nt.getImportateur().getMail());

        run2.setFontSize(14);
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph2,TextOrientation.RTL);



        XWPFParagraph paragraph3 = table.getRow(3).getCell(0).addParagraph();
        XWPFRun run3 = paragraph3.createRun() ;
        run3.setBold(true);
        run3.setText("المعلومات الخاصة بالنفايات المستوردة ");
        run3.setFontSize(14);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph3,TextOrientation.RTL);


        XWPFParagraph paragraph4 = table.getRow(4).getCell(0).addParagraph();
        XWPFRun run4 = paragraph4.createRun() ;
        run4.setText("اخطار رقم ");
        run4.setText("  ");
        run4.setText(nt.getNum_notification());
        run4.addBreak();

        run4.setText("النوع ");
        run4.setText("  ");
        run4.setText(nt.getCode().getNom_ar());

        run4.addBreak();

        run4.setText("المصدر ");
        run4.setText("  ");
        run4.setText(nt.getProducteur_text());

        run4.addBreak();

        run4.setText("الرمز ) المصنف المغربي للنفايات ( ");
        run4.setText("  ");
        run4.setText(nt.getCode().getNom_fr());

        run4.addBreak();

        run4.setText("الكمية ");
        run4.setText("  ");
        run4.setText(nt.getQuantite()+" " + nt.getUnite().getNom_fr());


        run4.setFontSize(14);
        run4.setFontFamily("Times New Roman");
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4,TextOrientation.RTL);


        XWPFParagraph paragraph5 = table.getRow(5).getCell(0).addParagraph();
        XWPFRun run5 = paragraph5.createRun() ;
        run5.setBold(true);
        run5.setText("المعلومات الخاصة بنقل النفايات ");
        run5.setFontSize(14);
        run5.setFontFamily("Times New Roman");
        paragraph5.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph5,TextOrientation.RTL);



        XWPFParagraph paragraph6 = table.getRow(6).getCell(0).addParagraph();
        XWPFRun run6 = paragraph6.createRun() ;
        run6.setText("اسم الشركة المكلفة بالنقل ");
        run6.setText("  ");
        run6.setText(nt.getTransporteurOne()==null?"":nt.getTransporteurOne().getNom_fr());

        run6.addBreak();

        run6.setText("رقم الرخصة ");
        run6.setText("  ");
        run6.setText(nt.getTransporteurOne()==null?"":nt.getTransporteurOne().getPattente());

        run6.setFontSize(14);
        run6.setFontFamily("Times New Roman");
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph6,TextOrientation.RTL);

        XWPFParagraph paragraph7 = table.getRow(7).getCell(0).addParagraph();
        XWPFRun run7 = paragraph7.createRun() ;
        run7.setBold(true);
        run7.setText("المعلومات الخاصة بمنشأة تثمين او معالجة النفايات ");
        run7.setFontSize(14);
        run7.setFontFamily("Times New Roman");
        paragraph7.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph7,TextOrientation.RTL);


        XWPFParagraph paragraph8 = table.getRow(8).getCell(0).addParagraph();
        XWPFRun run8 = paragraph8.createRun() ;
        run8.setText("اسم المنشاة ");
        run8.setText("  ");
        run8.setText(nt.getEliminateur()==null?"":nt.getEliminateur().getNom_fr());
        run8.addBreak();

        run8.setText("العنوان ");
        run8.setText("  ");
        run8.setText(nt.getEliminateur()==null?"":nt.getEliminateur().getAdresse_fr());
        run8.addBreak();

        run8.setText("الهاتف ");
        run8.setText("  ");
        run8.setText(nt.getEliminateur()==null?"":nt.getEliminateur().getTel());
        run8.addBreak();

        run8.setText("رقم رخصة المنشاة ");
        run8.setText("  ");
        run8.setText(nt.getEliminateur()==null?"":nt.getEliminateur().getPattente());
        run8.addBreak();

        run8.setText("النوع ");
        run8.setText("  ");
        if(nt.getOperation().equalsIgnoreCase("valorisation")) run8.setText(" تثمين ");
        if(nt.getOperation().equalsIgnoreCase("traitement")) run8.setText(" معالجة ");

        run8.setFontSize(14);
        run8.setFontFamily("Times New Roman");
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8,TextOrientation.RTL);


        XWPFParagraph paragraph9 = table.getRow(9).getCell(0).addParagraph();
        XWPFRun run9 = paragraph9.createRun() ;
        run9.setBold(true);
        run9.setText("مقرر الترخيص ");
        run9.setFontSize(14);
        run9.setFontFamily("Times New Roman");
        paragraph9.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph9,TextOrientation.RTL);


        XWPFParagraph paragraph10 = table.getRow(10).getCell(0).addParagraph();
        XWPFRun run10 = paragraph10.createRun() ;
        if(nt.getStatut().getId_statut_projet()==1) run10.setText("يمنح الترخيص باستيراد النفايات ");
        if(nt.getStatut().getId_statut_projet()==2) run10.setText("رفض الترخيص باستيراد النفايات ");
        run10.addBreak();
//HADI
        run10.setText("تعليل الرفض ");
        run10.setText("  ");
        run10.setText(nt.getCommentaire()==null?"":nt.getCommentaire());
        run10.addBreak();

        run10.setText("مدة صلاحية الترخيص من ");

        run10.setText(convertDate("dd/MM/yyyy",nt.getDateaut1()));
        run10.setText("إلى ");
        run10.setText(convertDate("dd/MM/yyyy",nt.getDateaut2()));

        XWPFParagraph paragraph101 = table.getRow(10).getCell(0).addParagraph();
        XWPFRun run101 = paragraph101.createRun() ;
        run101.setText(" التوقيع ");
        run101.setBold(true);
        run101.setFontSize(14);
        run101.addBreak();

        run10.setFontSize(14);
        run10.setFontFamily("Times New Roman");
        paragraph101.setAlignment(ParagraphAlignment.LEFT);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph10,TextOrientation.RTL);
        setOrientation(paragraph101,TextOrientation.RTL);
        //============================================================================

        String qr = "/qrMinistere.png";
        Path qrPath = Paths.get(GenerateWordDocuments.class.getResource(qr).toURI());

        document.createParagraph().createRun().addPicture(Files.newInputStream(qrPath),
                XWPFDocument.PICTURE_TYPE_PNG,qr,Units.toEMU(55), Units.toEMU(55));



        //============================================================================

        //=========================================
        //header & Footer

        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null) headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);

        XWPFParagraph px=header.getParagraphArray(0);
        XWPFRun runx=px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(455), Units.toEMU(100));

        String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);

        //=========================================

        //====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());


    }

    //
    public static ByteArrayInputStream generateEIE(int idNotif) throws IOException, InvalidFormatException, URISyntaxException {
        //init document
        XWPFDocument document= new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        //---------------- start par 1
        XWPFParagraph par1 = document.createParagraph();
        XWPFRun run1 = par1.createRun() ;
        XWPFRun run1_1 = par1.createRun() ;


        run1.setText("قرار رقم");
        run1.setText("  ");

        run1_1.setText(String.valueOf(idNotif));

        run1.setBold(true);
        run1.setFontSize(16);
        run1_1.setFontSize(16);
        run1_1.setFontFamily("Times New Roman");
        run1.setFontFamily("Times New Roman");
        par1.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(par1,TextOrientation.RTL);


        XWPFParagraph par2 = document.createParagraph();
        XWPFRun run2 = par2.createRun() ;

        run2.setText("قرار الموافقة البيئية");
        run2.setBold(true);
        run2.setFontSize(16);
        run2.setFontFamily("Times New Roman");

        par2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(par2,TextOrientation.RTL);


        XWPFParagraph par3 = document.createParagraph();
        XWPFRun run3 = par3.createRun();

        run3.setText("قطاع البيئة");
        run3.addBreak();
        run3.setBold(true);
        run3.setFontSize(16);
        run3.setFontFamily("Times New Roman");
        par3.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(par3,TextOrientation.RTL);


        XWPFParagraph par4 = document.createParagraph();
        XWPFRun run4 = par4.createRun();

        run4.setText("بناء على القانون رقم 12.03 " +
                "المتعلق بدراسات التأثير" +
                " على البيئة الصادر بتنفيذه الظهير" +
                " الشريف رقم 1.03.60 الصادر في 10" +
                " ربيع الأول 1424 )12 ماي 2003( " +
                "لاسيما المواد 1 و2 و7 و19 منه؛١٢");

        run4.setFontSize(14);
        run4.setFontFamily("Times New Roman");
        par4.setAlignment(ParagraphAlignment.BOTH);
        setOrientation(par4,TextOrientation.RTL);


        XWPFParagraph par5 = document.createParagraph();
        XWPFRun run5 = par5.createRun();

        run5.setText("وعلى المرسوم رقم 2.04.563 الصادر بتاريخ 5 ذو القعدة 1429 (4 نونبر 2008) المتعلق" +
                " باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة؛");

        run5.setFontSize(14);
        run5.setFontFamily("Times New Roman");
        par5.setAlignment(ParagraphAlignment.BOTH);
        setOrientation(par5,TextOrientation.RTL);

        XWPFParagraph par6 = document.createParagraph();
        XWPFRun run6 = par6.createRun();

        run6.setText("وعلى المرسـوم رقم 2.14.758 الصادر في 30 صفر " +
                "1436 (23 دجنبر 2014) في شأن تحديد اختصاصات " +
                "وتنظيم الوزارة المنتدبة المكلفة بالبيئة؛");

        run6.setFontSize(14);
        run6.setFontFamily("Times New Roman");
        par6.setAlignment(ParagraphAlignment.BOTH);
        setOrientation(par6,TextOrientation.RTL);


        XWPFParagraph par7 = document.createParagraph();
        XWPFRun run7 = par7.createRun();

        run7.setText("وعلى رأي اللجنة الوطنية لدراسات التأثير على البيئة خلال الاجتماع المنعقد بتاريخ ");
        run7.setText("2020/12/12");
        run7.setFontSize(14);
        run7.setFontFamily("Times New Roman");
        par7.setAlignment(ParagraphAlignment.BOTH);
        setOrientation(par7,TextOrientation.RTL);



        XWPFParagraph par8 = document.createParagraph();
        XWPFRun run8 = par8.createRun();

        run8.setText("قرر ما يلي :");
        run8.setFontSize(14);
        run8.setBold(true);
        run8.setFontFamily("Times New Roman");
        par8.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(par8,TextOrientation.RTL);


        XWPFParagraph par9 = document.createParagraph();
        XWPFRun run9 = par9.createRun();
        XWPFRun run9_1 = par9.createRun();

        run9.setBold(true);
        run9.setUnderline(UnderlinePatterns.SINGLE);
        run9.setText("المادة : 1");
        run9.setFontSize(16);
        run9.setFontFamily("Times New Roman");


        run9_1.setText(" تمنح الموافقة البيئية لمشروع  ");
        run9_1.setText(" . . . . . . ");
        run9_1.setFontSize(14);
        run9_1.addBreak();
        run9_1.setFontFamily("Times New Roman");
        par9.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(par9,TextOrientation.RTL);
        XWPFParagraph par10 = document.createParagraph();
        XWPFRun run10 = par10.createRun();
        XWPFRun run10_1 = par10.createRun();

        run10.setBold(true);
        run10.setUnderline(UnderlinePatterns.SINGLE);
        run10.setText("المادة : 2 ");
        run10.setFontSize(16);
        run10.setFontFamily("Times New Roman");


        run10_1.setText(" يلتزم صاحب المشروع باحترام خلاصات دراسة التأثير " +
                "على البيئة وبنود كناش التحملات المرفق بهذا القرار.  ");
        run10_1.setFontSize(14);
        run10_1.addBreak();
        run10_1.setFontFamily("Times New Roman");
        par10.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(par10,TextOrientation.RTL);



        XWPFParagraph par11 = document.createParagraph();
        XWPFRun run11 = par11.createRun();
        XWPFRun run11_1 = par11.createRun();

        run11.setBold(true);
        run11.setUnderline(UnderlinePatterns.SINGLE);
        run11.setText("المادة : 3 ");
        run11.setFontSize(16);
        run11.setFontFamily("Times New Roman");


        run11_1.setText(" تعتبر هذه الموافقة البيئية لاغية إذا لم يتم إنجاز" +
                "المشروع خلال أجل خمس سنوات ابتداء من تاريخ الحصول عليها.");
        run11_1.setFontSize(14);
        run11_1.addBreak();
        run11_1.setFontFamily("Times New Roman");
        par11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(par11,TextOrientation.RTL);
        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null) headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);

        XWPFParagraph px=header.getParagraphArray(0);
        XWPFRun runx=px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(455), Units.toEMU(100));

        String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);

        //=========================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }




    public static ByteArrayInputStream generateInstallation(Installation ct) throws IOException, InvalidFormatException, URISyntaxException {
        // init document
        XWPFDocument document = new XWPFDocument();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
/*
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(720L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(1440L));*/

        // Add new Paragraph to document
        XWPFParagraph Paraghraph = document.createParagraph();
        XWPFRun runIla = Paraghraph.createRun();
        runIla.setBold(true);
        runIla.setText("قرار");
        runIla.setFontSize(14);
        Paraghraph.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(Paraghraph, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph0 = document.createParagraph();
        XWPFRun run0 = paragraph0.createRun();
        run0.setBold(true);
        run0.setText("لوزير الطاقة والمعادن والبيئة ");
        run0.setFontSize(14);
        run0.setFontFamily("Times New Roman");
        paragraph0.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph0, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun run1 = paragraph1.createRun();
        run1.setBold(true);
        run1.setText(" رقم " + ct.getNum_demande() + "/2020");
        run1.setFontSize(14);
        run1.setFontFamily("Times New Roman");
        paragraph1.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph1, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph2 = document.createParagraph();
        XWPFRun run2 = paragraph2.createRun();
        run2.setBold(true);
        run2.setText(" بترخيص لمعالجة النفايات الخطرة لشركة "+ ct.getRaison());
        run2.setFontSize(14);
        run2.setFontFamily("Times New Roman");
        paragraph2.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph2, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraphe00 = document.createParagraph();
        XWPFRun run00 = paragraphe00.createRun();
        run00.setBold(true);
        run00.setText("وزير الطاقة والمعادن والبيئة ");
        run00.setFontSize(14);
        run00.setFontFamily("Times New Roman");
        paragraphe00.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraphe00, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph3 = document.createParagraph();
        XWPFRun run3 = paragraph3.createRun();
        run3.setText("-\tبناء على قرار وزير الطاقة والمعادن والبيئة رقم " + ct.getNum_demande() + " المتعلق بالاختصاصات وزير الطاقة والمعادن والبيئة ");
        run3.setFontSize(12);
        run3.setFontFamily("Times New Roman");
        paragraph3.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph3, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph4 = document.createParagraph();
        XWPFRun run4 = paragraph4.createRun();
        run4.setText("-");
        run4.addTab();
        run4.setText(" وعلى القانون رقم 28-00 المتعلق بتدبير النفايات والتخلص منها الصادر بتنفيذه الظهير الشريف رقم 1-06-153 بتاريخ 30 شوال 22)1427 نونبر (2006");
        run4.setFontSize(12);
        paragraph4.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph4, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph5 = document.createParagraph();
        XWPFRun run5 = paragraph5.createRun();
        run5.setText("-");
        run5.addTab();
        run5.setText("وعلى المرسوم رقم 2-07-253 صادر في 14 من رجب 18)1429 يوليو (2008 المتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة؛");
        run5.setFontSize(12);
        paragraph5.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph5, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph6 = document.createParagraph();
        XWPFRun run6 = paragraph6.createRun();
        run6.setText("-");
        run6.addTab();
        run6.setText(" وعلى المرسوم رقم 2-14-85 الصادر في 28 من ربيع الأول 20)1436 يناير (2015 المتعلق بتدبير النفايات الخطرة");
        run6.setFontSize(12);
        paragraph6.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph6, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph7 = document.createParagraph();
        XWPFRun run7 = paragraph7.createRun();
        run7.setText("-");
        run7.addTab();
        run7.setText(" وعلى قرار الوزيرة المنتدبة لدى وزير الطاقة والمعادن والماء والبيئة المكلفة بالبيئة رقم 3184.15 الصادر في 9 ذي الحجة 23)1436 سبتمبر (2015 المتعلق بتطبيق المواد 5 6 7 و11 من المرسوم رقم 85-14-2 المشار إليه أعلاه؛");
        run7.setFontSize(12);
        paragraph7.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph7, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph8 = document.createParagraph();
        XWPFRun run8 = paragraph8.createRun();
        run8.setText("-");
        run8.addTab();
        run8.setText("وعلى تقرير اللجنة المكونة من ممثلي السلطات الحكومية المكلفة بالبيئة خلال الزيارة الميدانية لشركة"  + ct.getRaison() + " ");
        run8.setFontSize(12);
        paragraph8.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph8, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph10 = document.createParagraph();
        XWPFRun run10 = paragraph10.createRun();
        run10.setText("\t: قرر ما يلي");
        run10.setFontSize(12);
        paragraph10.setAlignment(ParagraphAlignment.CENTER);
        setOrientation(paragraph10, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph11 = document.createParagraph();
        XWPFRun run11 = paragraph11.createRun();
        run11.setText(" -");
        String date2 = "...";
        if(ct.getDateDepot()!=null){
            date2 = dateFormat.format(ct.getDateValidation());
        }
        run11.setText("المادة الأولى: تمنح رخصة لمعالجة النفايات الخطرة المحددة في اللائحة خلفه لشركة " + ct.getRaison() + " المتواجدة ب " + ct.getAdresse() + "بتاريخ" + date2);
        run11.setFontSize(12);
        paragraph11.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph11, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph12 = document.createParagraph();
        XWPFRun run12 = paragraph12.createRun();
        run12.setText(" -");
        run12.setText("المادة الثانية: يلتزم صاحب الرخصة باحترام القوانين والمعايير المتعلقة بهذا المجال");
        run12.setFontSize(12);
        paragraph12.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph12, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph13 = document.createParagraph();
        XWPFRun run13 = paragraph13.createRun();
        run13.setText(" -");
        run13.setText("المادة الثالثة: يمنح هذا الترخيص لمدة أقصاها خمس ");
        run13.setText("(5)");
        run13.setText(" سنوات قابلة للتجديد ابتداء من تاريخ صدورها؛");
        run13.setFontSize(12);
        paragraph13.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph13, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph14 = document.createParagraph();
        XWPFRun run14 = paragraph14.createRun();
        run14.setText(" -");
        run14.setText("المادة الرابعة: كل مخالفة للمقتضيات القانونية المذكورة أعلاه تعرض المعني بالأمر للعقوبة المنصوص عليها في القوانين الجاري بها العمل");
        run14.setText(" وتسحب منه الرخصة ولا يمكن لصاحبها المطالبة بأي تعويض كيفما كان نوعه؛");
        run14.setFontSize(12);
        run14.addBreak();
        paragraph14.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph14, TextOrientation.RTL);

        // Add new Paragraph to document
        XWPFParagraph paragraph15 = document.createParagraph();
        XWPFRun run15 = paragraph15.createRun();
        run15.setText("وحرر بالرباط في"+ dateFormat.format(new Date()) +" ");
        run15.setFontSize(12);
        paragraph15.setAlignment(ParagraphAlignment.RIGHT);
        setOrientation(paragraph15, TextOrientation.RTL);

//=====================================================================================================


        //============= Fusion ==========================================


        XWPFParagraph paragraph36 = document.createParagraph();
        XWPFRun run36 = paragraph36.createRun();
        run36.setText("");
        run36.setFontSize(10);
        run36.addBreak();
        run36.addBreak();
        run36.setFontFamily("Times New Roman");
        paragraph36.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph36, TextOrientation.LTR);

        XWPFParagraph paragraph37 = document.createParagraph();
        XWPFRun run37 = paragraph37.createRun();
        run37.setText("  Décret n°2-07-253 du 18 juillet 2008 portant classification des déchets et fixant la liste des déchets dangereux.");
        run37.setFontSize(10);
        run37.setFontFamily("Times New Roman");
        paragraph37.setAlignment(ParagraphAlignment.LEFT);
        setOrientation(paragraph37, TextOrientation.LTR);
        paragraph37.setBorderTop(Borders.BASIC_WIDE_INLINE);
        //=========================================
        //header & Footer


        XWPFHeaderFooterPolicy headerFooterPolicy = document.getHeaderFooterPolicy();
        if (headerFooterPolicy == null)	headerFooterPolicy = document.createHeaderFooterPolicy();

        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
        XWPFParagraph px = header.getParagraphArray(0);
        XWPFRun runx = px.createRun();

        String logo = "/word_header.png";
        Path imagePath = Paths.get(GenerateWordDocuments.class.getResource(logo).toURI());
        XWPFPicture picture = runx.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG,logo,
                Units.toEMU(495), Units.toEMU(100));

//		String blip = header.getRelationId(header.getAllPackagePictures().get(0));
        String blip ="rId1";
        picture.getCTPicture().getBlipFill().getBlip().setEmbed(blip);
        setOrientation(px, GenerateWordDocuments.TextOrientation.LTR);
        px.setAlignment(ParagraphAlignment.CENTER);

        // ====================================================
        document.write(out);
        return new ByteArrayInputStream(out.toByteArray());

    }

}
