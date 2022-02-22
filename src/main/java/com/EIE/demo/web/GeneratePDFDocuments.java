package com.EIE.demo.web;

import com.EIE.demo.model.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.springframework.beans.factory.annotation.Value;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.List;

public class GeneratePDFDocuments {


    @Value("${url}")
    private static String urlRest;



    private static void addFooter(PdfWriter writer, Image img){
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);

        PdfPTable footer = new PdfPTable(2);
        // set defaults
        footer.setWidthPercentage(80);
        footer.setTotalWidth(550);
        footer.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        footer.setLockedWidth(true);
        footer.getDefaultCell().setFixedHeight(90);

        // add copyright
        footer.addCell(img);

        PdfPCell cells = new PdfPCell();
        Paragraph pf = new Paragraph();
        cells.setPaddingTop(50);
        pf.setFont(font);
        pf.setAlignment(Element.ALIGN_CENTER);
        cells.setBorder(Rectangle.NO_BORDER);
        pf.add("Document généré depuis le portail https://e-services.environnement.gov.ma le "+String.valueOf(dateFormat.format(new Date())));
        cells.addElement(pf);
        footer.addCell(cells);

        // write page
        PdfContentByte canvas = writer.getDirectContent();
        canvas.beginMarkedContentSequence(PdfName.ARTIFACT);
        footer.writeSelectedRows(0, -1, 34, 95, canvas);
        canvas.endMarkedContentSequence();
    }


    static String RTL_LTR(String Nom_Fr){
        String[] str = Nom_Fr.split(" ");
        String[] str2 = Nom_Fr.split(" ");
        for(int i=1; i<=str.length; i++)
            str2[i-1] = str[str.length-i];
        return String.join(" ", str2);
    }

    public static ByteArrayInputStream generateDocumentDeNotification(Notification ns) throws DocumentException, ParseException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(base,11.0f);
        Font font=new Font(base,8.0f);
        Font fontTitre = new Font(base,8.0f,Font.BOLD);
        Font fontbold=new Font(base,8.0f);
        Font fontBox = new Font(base2, 8.0f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Document de notification pour les mouvements des dechets dangereux vers l'installation de traitement ou d'elimination ");
        headerPar.setFont(font);
        headerPar.setSpacingAfter(2);


        //Declaring Table
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);

        //Paragraph ==========================
        Paragraph par1=new Paragraph(16);

        par1.setFont(font);
        par1.add(new Phrase("1.Importateur- Notifiant : ",fontbold));
        par1.add(Chunk.NEWLINE);
        //========

        String nom_importateur ="";
        String adresse_importateur ="";
        String persone_a_contacte_importateur = "";
        String tele_importateur ="";
        String fax_importateur ="";
        String email_importateur ="";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant ww = ns.getImportateur();
            nom_importateur = ww.getNom_fr();
            adresse_importateur =ww.getAdresse_fr();
            tele_importateur =ww.getTel();
            fax_importateur =ww.getFax();
            email_importateur =ww.getMail();
        }

        par1.add("Nom de la société : ");
//        par1.add("NOM");
        par1.add(nom_importateur);
        par1.add(Chunk.NEWLINE);

        par1.add("Adresse : ");
        par1.add(adresse_importateur);
//        par1.add("ADRESSE");
        par1.add(Chunk.NEWLINE);

        par1.add("Tel : ");
        par1.add(tele_importateur);
//        par1.add("TELEPHONE");
        par1.add(Chunk.NEWLINE);

        par1.add("Fax : ");
        par1.add(fax_importateur);
//        par1.add("FAX");
        par1.add(Chunk.NEWLINE);

        par1.add("Mail : ");
        par1.add(email_importateur);
//        par1.add("MAIL");
        par1.add(Chunk.NEWLINE);

        PdfPCell cellMerged = new PdfPCell();
        cellMerged.addElement(par1);
        cellMerged.setRowspan(3);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par2=new Paragraph(13);
        par2.setFont(font);
        //========
        String numero_notification=ns.getNum_notification()==null?"":ns.getNum_notification();
        String elimination="";
        if (ns.getEliminateur()!=null){
            elimination=ns.getEliminateur().getAdresse_fr()==null?"":ns.getEliminateur().getAdresse_fr();
        }

        boolean isElimination=ns.getOperation().equalsIgnoreCase("traitement");
        boolean isExpedition=ns.getUniques().equalsIgnoreCase("Expéditions multiples");

        //========

        par2.add(new Phrase("2.No. de notification : ",fontbold));
        par2.add(numero_notification);
        par2.add(Chunk.NEWLINE);

        //Add Here Condition for checking the boxes

        par2.add("Notification consernant :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("A.i) Expedition unique  :");
        par2.add(isExpedition?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Expedition multiples:");
        par2.add(isExpedition?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("B.i) Elimination             :");
        par2.add(isElimination?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Valorisation              :");
        par2.add(isElimination?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        PdfPCell cell = new PdfPCell();
        cell.addElement(par2);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par3=new Paragraph(13);
        //========
        String nombre_expedition_prevu="";
        //========

        par3.add(new Phrase("3.Nombre total d'éxpeditions prévues : ",fontbold));
        par3.add(new Phrase(ns.getExpedition(),fontbold));

        par3.setSpacingAfter(7);

        cell = new PdfPCell();
        cell.addElement(par3);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par4=new Paragraph(13);
        par4.setFont(font);
        par4.setSpacingAfter(7);
        //========

        par4.add(new Phrase("4.Quantité total prévue : "+ns.getQuantite()+" "+ns.getUnite().getNom_fr(),fontbold));
        par4.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par4);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par5=new Paragraph(13);
        par5.setFont(font);
        par5.setSpacingAfter(7);
        //========
        String premier_depart=ns.getPremier()==null?"":ns.getPremier();
        String dernier_depart=ns.getDernier()==null?"":ns.getDernier();
        //========
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = formatter.parse(premier_depart);
        Date date2 = formatter.parse(dernier_depart);


        par5.add(new Phrase("5.Période prévue des expéditions",fontbold));
        par5.add(Chunk.NEWLINE);
        par5.add("premier départ : ");
        par5.add(dateFormat.format(date1)+"                      ");
        par5.add("Dernier départ : ");
        par5.add(dateFormat.format(date2)+"");

        cell = new PdfPCell();
        cell.addElement(par5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par6=new Paragraph(13);
        par6.setFont(font);
        par6.setSpacingAfter(7);
        //========
        String type_conditionnement ="";

        if(ns.getTypeconditionnement()!=null){
            TypeConditionnement t = ns.getTypeconditionnement();
            type_conditionnement = t.getNom_fr();
        }
        String prescription="";
        boolean isPrescription=prescription.equalsIgnoreCase("oui");

        //========

        par6.add(new Phrase("6.Type(s) de conditionnnement(3) : ",fontbold));
        par6.add(type_conditionnement);
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase("Prescriptions spéciales de manutention : ",fontbold));
        par6.add(oui);
        par6.add(uncheckedChunk);
        par6.add("      ");
        par6.add(non);
        par6.add(uncheckedChunk);

        cell = new PdfPCell();
        cell.addElement(par6);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par7=new Paragraph(13);
        par7.setFont(font);
        par7.setSpacingAfter(7);
        //========

        String nom_transporteur ="";
        String adresse_transporteur ="";
        String persone_a_contacte_transporteur = "";
        String tele_transporteur ="";
        String fax_transporteur ="";
        String email_transporteur ="";
        String moyen_de_transporteur = "";

        if(ns.getTransporteur()!=null){
            List<TransporteurParam> i = ns.getTransporteur();
            if(i.size()>0){
                nom_transporteur = i.get(0).getNom();
                adresse_transporteur =i.get(0).getAdresse();
                tele_transporteur =i.get(0).getTel();
                fax_transporteur =i.get(0).getFax();
                // email_transporteur =i.get(0).getAdresse();
                // moyen_de_transporteur =ns.getTransporteur().get(0).getMoyenTransport().getNom_fr();
            }
        }

        //========

        par7.add(new Phrase("7.Transporteur(s) prévu :",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("Nom de la société : ");
        par7.add(nom_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(adresse_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Tel : ");
        par7.add(tele_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Fax : ");
        par7.add(fax_transporteur);
        par7.add(Chunk.NEWLINE);


        par7.add("Moyen de transport (5) : ");
        par7.add(moyen_de_transporteur);
        par7.add(Chunk.NEWLINE);

        cellMerged =new PdfPCell();
        cellMerged.setRowspan(2);
        cellMerged.addElement(par7);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par8=new Paragraph(13);
        par8.setFont(font);
        par8.setSpacingAfter(7);
        //========


        //========

        par8.add(new Phrase("10.Opérations d'élimination / Valorisation",fontbold));
        par8.add(Chunk.NEWLINE);
        par8.add("Code D (1)/Code R (2) : ");
        par8.add(ns.getOperationdelimination());

        cell = new PdfPCell();
        cell.addElement(par8);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par9=new Paragraph(13);
        par9.setFont(font);
        par9.setSpacingAfter(7);
        //========


        //========


        par9.add(new Phrase("11.Dénomination et composition des déchets : ",fontbold));
        par9.add(new Phrase(ns.getCode().getNom_ar(),fontbold));
        cell = new PdfPCell();
        cell.addElement(par9);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(7);
        //========

        String nom_producteur ="";
        String adresse_producteur ="";
        String tele_producteur ="";
        String fax_producteur ="";
        String mail_producteur ="";
        String lieu_procede_producteur ="";

        if(ns.getProducteur()!=null){
            Producteur p = ns.getProducteur();
            nom_producteur = p.getNom_fr();
            adresse_producteur =p.getAdresse_fr();
            tele_producteur =p.getTel();
            fax_producteur =p.getFax();
            mail_producteur =p.getMail();
            lieu_procede_producteur =p.getLieu_fr();
        }

        //========


        par10.add(new Phrase("8.Producteur(s) des déchets",fontbold));
        par10.add(Chunk.NEWLINE);

        par10.add("Nom de la société : ");
        par10.add(nom_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Adresse : ");
        par10.add(adresse_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Tel : ");
        par10.add(tele_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Fax : ");
        par10.add(fax_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Mail : ");
        par10.add(mail_producteur);
        par10.add(Chunk.NEWLINE);

        par10.add("Lieu et procede de production : ");
        par10.add(lieu_procede_producteur);
        par10.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par10);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(7);
        //========
        String carateristiques_physique = "";
        if(ns.getCaracteristquePhysique() != null){
            CaracteristquePhysique c = ns.getCaracteristquePhysique();
            carateristiques_physique = c.getNom_fr();
        }
        //========

        par11.add(new Phrase("12.Caractéristiques physique (6) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add(carateristiques_physique);

        cell = new PdfPCell();
        cell.addElement(par11);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par12=new Paragraph(13);
        par12.setFont(font);
        par12.setSpacingAfter(7);

        String nom_entreprise ="";
        String address_entreprise ="";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant i = ns.getImportateur();
            nom_entreprise = i.getNom_fr();
            address_entreprise =i.getAdresse_fr();

        }

        if(isElimination){
            par12.add(new Phrase("9. Installation de valorisation / élimination ",fontbold));
            //AddCondition to check or no
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  ",fontbold));
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
        }else{
            par12.add(new Phrase("9. Installation de valorisation / élimination ",fontbold));
            //AddCondition to check or no
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  ",fontbold));
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
        }


        par12.add("Nom de la société : ");
        par12.add(ns.getEliminateur()!=null?ns.getEliminateur().getNom_fr():"");
        par12.add(Chunk.NEWLINE);
        par12.add("Adresse : ");
        par12.add(ns.getEliminateur()!=null?ns.getEliminateur().getAdresse_fr():"");
        par12.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par12);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par13=new Paragraph(13);
        par13.setFont(font);
        par13.setSpacingAfter(7);
        //========

        par13.add(new Phrase("13.Identifications des déchets",fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add("Convention de Bale.Annex 8(ou 9 s'il y a lieu) : ");
        par13.add("CONV. BALE");
        par13.add(Chunk.NEWLINE);
        par13.add("Code National(Catalogue Marocain des déchets) : ");
        par13.add(ns.getCode().getNom_fr());
        par13.add(Chunk.NEWLINE);
        par13.add("Code H : ");
        par13.add(ns.getCodeH());
        par13.add(Chunk.NEWLINE);
        par13.add("Code(s) des douanes (SH) : ");
        par13.add("");
        par13.add(Chunk.NEWLINE);
        par13.add("Autre (preciser) : ");
        par13.add("");

        cell = new PdfPCell();
        cell.addElement(par13);
        table.addCell(cell);

        Paragraph par14=new Paragraph(13);
        par14.setFont(font);
        par14.setSpacingAfter(7);

        par14.add(new Phrase("Nom de la zone franche d'expédition",fontbold));

        cell = new PdfPCell();
        cell.addElement(par14);
        table.addCell(cell);

        Paragraph par15=new Paragraph(13);
        par15.setFont(font);
        par15.setSpacingAfter(3);
        //========

        String nom_zone_franche="Nom zone franche";

        if(ns.getZonneFranche() != null){
            ZonneFranche z = ns.getZonneFranche();
            nom_zone_franche = z.getNom_fr();
        }
        String nom_destination=ns.getDestination_final()==null?"":ns.getDestination_final();
        //========

        par15.add(new Phrase("Nom de la destination finale",fontbold));

        cell = new PdfPCell();
        cell.addElement(par15);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase( nom_zone_franche ) );
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(nom_destination));
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(7);
        //========
        String bureau_douane="";
        //========



        par18.add(new Phrase("14.Bureau de douane d'entrée :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par18);
        table.addCell(cellMerged);

        cellMerged = new PdfPCell(new Phrase(bureau_douane));
        cellMerged.setColspan(2);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par20=new Paragraph(11);
        par20.setFont(font);
        par20.setSpacingAfter(7);
        par20.add(new Phrase("15.Declaration de l'importateur/producteur : ",fontbold));
        par20.add(Chunk.NEWLINE);
        par20.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement des déchets sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises notamment l'assurance de transport des déchets dangereuses.");
        par20.add(Chunk.NEWLINE);

        par20.add("Nom de la société : ");
        par20.add(nom_importateur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(dateFormat.format(new Date()));
        par20.add(new Chunk(glue));
        par20.add("Signature :  ");
        par20.add(new Chunk(glue));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par20);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par21=new Paragraph(13);
        par21.setFont(font);
        par21.setSpacingAfter(7);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("RESERVE AUX AUTORITES COMPETANTES",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par21);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par22=new Paragraph(13);
        par22.setFont(font);
        par22.setSpacingAfter(7);
        //========
        String notification_recu=ns.getDate_reel()==null?"":dateFormat.format(ns.getDate_reel());


        //========


        par22.add(new Phrase("16.Accusé de réception delivré par le Département de l'Environement",fontbold));
        par22.add(Chunk.NEWLINE);

        par22.add("Notification reçue le : ");
        par22.add(notification_recu);
        par22.add(Chunk.NEWLINE);

        par22.add("Accusé de réception transmis le : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de l'autorité compétente  : ");
        par22.add(Chunk.NEWLINE);
        par22.add("Cachet et/ou signature  : ");
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
//        par23.setSpacingAfter(7);

        par23.add(new Phrase("17.Consentement écrit au mouvement accorde par le departement de l'environement",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement accordé le :                          ");
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement valable du :                                 ");
        par23.add("au :                                  ");
        par23.add(Chunk.NEWLINE);

        par23.add("Conditions particulières : ");
        par23.add(oui);
        //Add Condition to check to uncheck
        par23.add(uncheckedChunk);
        par23.add("      ");
        par23.add(non);
        //Here Also
        par23.add(uncheckedChunk);
        par23.add(Chunk.NEWLINE);
        par23.add("Nom de l'autorité compétente  : ");
        par23.add(Chunk.NEWLINE);
        par23.add("Cachet et/ou signature  : ");
        par23.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par23);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par24=new Paragraph(13);
        par24.setSpacingAfter(7);
        par24.add(new Phrase("18.Conditions particulieresau consentement ou raisons de l'objection :",fontbold));

//Testing before adding to the document
//        Chunk oui = new Chunk("Oui : ",font);
//        par24.add(oui);
//        par24.add(checkedChunk);
//
//        Chunk non = new Chunk("Non : ",font);
//        par24.add(non);
//        par24.add(uncheckedChunk);


        cellMerged = new PdfPCell();
        cellMerged.setColspan(2);
        cellMerged.addElement(par24);
        table.addCell(cellMerged);

        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentDeNotification2(Notification ns) throws DocumentException, ParseException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(base,14.0f);
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base2, 13.0f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Document de notification - Mouvement/transfers transfrontières de déchets ");
        headerPar.setFont(font);
        headerPar.setSpacingAfter(2);


        //Declaring Table
        PdfPTable table = new PdfPTable(10);
        table.setWidthPercentage(100);

        //Paragraph ==========================
        Paragraph par1=new Paragraph(16);

        par1.setFont(font);
        par1.add(new Phrase(ns.getZf_et().equals("XD")?"1.Importateur-Notifiant   ":"1.Exportateur-Notifiant   ",fontbold));
        par1.add("N° d'enregistrement :");
        par1.add(Chunk.NEWLINE);
        //========

        if(ns.getZf_et().equals("XD")){
            par1.add("Nom de l'importateur notifiant : ");
        }else if(ns.getZf_et().equals("ET")){
            par1.add("Nom de l'exportateur Notifiant : ");
        }else{
            par1.add("Nom de la société : ");
        }

//        par1.add("NOM");
        par1.add(ns.getNom());
        par1.add(Chunk.NEWLINE);

        par1.add("Adresse : ");
        par1.add(ns.getAdresse());
//        par1.add("ADRESSE");
        par1.add(Chunk.NEWLINE);

        par1.add("Tél : ");
        par1.add(ns.getTel());
//        par1.add("TELEPHONE");
        par1.add(Chunk.NEWLINE);

        par1.add("Télécopie : ");
        par1.add(ns.getTelecopie());
//        par1.add("FAX");
        par1.add(Chunk.NEWLINE);

        par1.add("Courier éléctronique : ");
        par1.add(ns.getCourrier());
//        par1.add("MAIL");
        par1.add(Chunk.NEWLINE);

        PdfPCell cellMerged = new PdfPCell();
        cellMerged.addElement(par1);
        cellMerged.setRowspan(3);
        cellMerged.setColspan(5);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par2=new Paragraph(13);
        par2.setFont(font);
        //========
        String numero_notification=ns.getNum_notification()==null?"":ns.getNum_notification();
        String elimination="";
        if (ns.getEliminateur()!=null){
            elimination=ns.getEliminateur().getAdresse_fr()==null?"":ns.getEliminateur().getAdresse_fr();
        }

        boolean isElimination=ns.getOperation().equalsIgnoreCase("traitement");
        boolean isExpedition=ns.getUniques().equalsIgnoreCase("Expéditions multiples");

        //========

        par2.add(new Phrase("3.No. de notification : ",fontbold));
        par2.add(numero_notification);
        par2.add(Chunk.NEWLINE);

        //Add Here Condition for checking the boxes

        par2.add("Notification consernant :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("A.i) Transfert unique  :");
        par2.add(isExpedition?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Transfer multiples:");
        par2.add(isExpedition?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("B.i) Elimination             :");
        par2.add(isElimination?checkedChunk:uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add("ii) Valorisation              :");
        par2.add(isElimination?uncheckedChunk:checkedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        par2.add("C. Instalation de valorisation bénéficiant du consentement préable (2) (3) :");
        par2.add(new Chunk(glue));
        par2.add("Oui");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));
        par2.add("Non");
        par2.add(uncheckedChunk);
        par2.add(new Chunk(glue));

        par2.add(Chunk.NEWLINE);

        PdfPCell cell = new PdfPCell();
        cell.addElement(par2);
        cell.setColspan(5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par3=new Paragraph(13);

        par3.add(new Phrase("4.Nombre total de transfert prévues : ",fontbold));
        par3.add(new Phrase(ns.getExpedition(),fontbold));

        par3.setSpacingAfter(7);

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par4=new Paragraph(13);
        par4.setFont(font);
        par4.setSpacingAfter(7);
        //========
        String qte = ns.getQuantite()!=null?ns.getQuantite():"";
        String unite = ns.getUnite().getNom_fr()!=null?ns.getUnite().getNom_fr():"";

        par4.add(new Phrase("5.Quantité total prévue (4) : "+qte+" "+unite,fontbold));
        par4.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setColspan(5);
        table.addCell(cell);

        Paragraph par01=new Paragraph(16);
        par01.setFont(font);
        if(!ns.getZf_et().equals("TR")){
            par01.add(new Phrase(ns.getZf_et().equals("XD")?"2.Exportateur- Notifiant   ":"2.Importateur- Notifiant   ",fontbold));
        }
        if(ns.getZf_et().equals("TR")) {
            par01.add(new Phrase("2.Importateur-Destinataire", fontbold));
        }
        par01.add("N° d'enregistrement :");
        par01.add(Chunk.NEWLINE);
        //========

        String nom_importateur ="";
        String adresse_importateur ="";
        String tele_importateur ="";
        String fax_importateur ="";
        String email_importateur ="";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant ww = ns.getImportateur();
            nom_importateur = ww.getNom_fr();
            adresse_importateur =ww.getAdresse_fr();
            tele_importateur =ww.getTel();
            fax_importateur =ww.getFax();
            email_importateur =ww.getMail();
        }

        par01.add("Nom de la société : ");
//        par1.add("NOM");
        par01.add(nom_importateur);
        par01.add(Chunk.NEWLINE);

        par01.add("Adresse : ");
        par01.add(adresse_importateur);
//        par1.add("ADRESSE");
        par01.add(Chunk.NEWLINE);

        par01.add("Tél : ");
        par01.add(tele_importateur);
//        par1.add("TELEPHONE");
        par01.add(Chunk.NEWLINE);

        par01.add("Télécopie : ");
        par01.add(fax_importateur);
//        par1.add("FAX");
        par01.add(Chunk.NEWLINE);

        par01.add("Courier éléctronique : ");
        par01.add(email_importateur);
//        par1.add("MAIL");
        par01.add(Chunk.NEWLINE);

        cellMerged = new PdfPCell();
        cellMerged.addElement(par01);
        cellMerged.setRowspan(2);
        cellMerged.setColspan(5);
        table.addCell(cellMerged);






        //Paragraph ==========================
        Paragraph par5=new Paragraph(13);
        par5.setFont(font);
        par5.setSpacingAfter(7);
        //========
        String premier_depart=ns.getPremier()==null?"":ns.getPremier();
        String dernier_depart=ns.getDernier()==null?"":ns.getDernier();
        //========
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = formatter.parse(premier_depart);
        Date date2 = formatter.parse(dernier_depart);

        par5.add(new Phrase("6.Période prévue pour le(s) transfert(s)",fontbold));
        par5.add(Chunk.NEWLINE);
        par5.add("premier départ : ");
        par5.add(dateFormat.format(date1)+"                      ");
        par5.add("Dernier départ : ");
        par5.add(dateFormat.format(date2)+"");

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setColspan(5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par6=new Paragraph(13);
        par6.setFont(font);
        par6.setSpacingAfter(7);
        //========
        String type_conditionnement ="";

        if(ns.getTypeconditionnement()!=null){
            TypeConditionnement t = ns.getTypeconditionnement();
            type_conditionnement = t.getNom_fr();
        }
        String prescription="";
        boolean isPrescription=prescription.equalsIgnoreCase("oui");

        //========

        par6.add(new Phrase("7.Type(s) de conditionnnement(3) : ",fontbold));
        par6.add(type_conditionnement);
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase("Prescriptions spéciales de manutention(6) : ",fontbold));
        par6.add(oui);
        par6.add(uncheckedChunk);
        par6.add("      ");
        par6.add(non);
        par6.add(uncheckedChunk);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par7=new Paragraph(13);
        par7.setFont(font);
        par7.setSpacingAfter(7);
        //========

        String nom_transporteur ="";
        String adresse_transporteur ="";
        String persone_a_contacte_transporteur = "";
        String tele_transporteur ="";
        String fax_transporteur ="";
        String email_transporteur ="";
        String moyen_de_transporteur = "";

        String nom_transporteurs ="";
        String adresse_transporteurs ="";
        String persone_a_contacte_transporteurs = "";
        String tele_transporteurs ="";
        String fax_transporteurs ="";
        String email_transporteurs ="";
        String moyen_de_transporteurs = "";

        if(ns.getTransporteur()!=null){
            List<TransporteurParam> i = ns.getTransporteur();
            if(i.size()>0){

                nom_transporteur = i.get(0).getNom();
                adresse_transporteur =i.get(0).getAdresse();
                tele_transporteur =i.get(0).getTel();
                fax_transporteur =i.get(0).getFax();
                email_transporteur =i.get(0).getAdresse();
                //            moyen_de_transporteur =ns.getTransporteur().get(0).getMoyenTransport().getNom_fr();
            }
        }
        if(ns.getTransporteur_etranger()!=null){
            List<TransporteurEtranger> i = ns.getTransporteur_etranger();
            if(i.size()>0){

                nom_transporteur = i.get(0).getRaison_social();
                adresse_transporteur =i.get(0).getAdresse();
                //            moyen_de_transporteur =ns.getTransporteur().get(0).getMoyenTransport().getNom_fr();
            }
        }
        //========
        par7.add(new Phrase("8.Transporteur(s) prévu(s)  ",fontbold));
        par7.add("N° d'enregistrement :");
        par7.add(Chunk.NEWLINE);

        par7.add("Nom de la société : ");
        par7.add(nom_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(adresse_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Tél : ");
        par7.add(tele_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Télécopie : ");
        par7.add(fax_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(email_transporteur);
        par7.add(Chunk.NEWLINE);

        par7.add("Moyen de transport (5) : ");
        par7.add(moyen_de_transporteur);
        par7.add(Chunk.NEWLINE);

        cellMerged =new PdfPCell();
        cellMerged.setRowspan(2);
        cellMerged.setColspan(5);
        cellMerged.addElement(par7);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par8=new Paragraph(13);
        par8.setFont(font);
        par8.setSpacingAfter(7);
        //========


        //========

        par8.add(new Phrase("11.Opérations d'élimination / Valorisation (2)",fontbold));
        par8.add(Chunk.NEWLINE);
        par8.add("Code D /Code R (5) : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Technique utilisé (6) : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Motif de l'exportation (1) (6) : ");
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setColspan(5);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par9=new Paragraph(13);
        par9.setFont(font);
        par9.setSpacingAfter(7);
        //========


        //========


        par9.add(new Phrase("12.Dénomination et composition des déchets (6) : ",fontbold));
        par9.add(new Phrase(ns.getCode().getNom_ar(),font));
        cell = new PdfPCell();
        cell.setColspan(5);
        cell.addElement(par9);
        table.addCell(cell);


        //Paragraph ==========================
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(7);
        //========

        String nom_producteur ="";
        String adresse_producteur ="";
        String persone_a_contacte_producteur ="";
        String tele_producteur ="";
        String fax_producteur ="";
        String mail_producteur ="";
        String lieu_procede_producteur ="";

        String nom_producteurs ="";
        String adresse_producteurs ="";
        String persone_a_contacte_producteurs ="";
        String tele_producteurs ="";
        String fax_producteurs ="";
        String mail_producteurs ="";
        String lieu_procede_producteurs ="";


        if(ns.getProducteurs()!=null){
            List<Producteur> i = ns.getProducteurs();
            if(i.size()>0){
                nom_producteurs = i.get(0).getNom_fr();
                adresse_producteurs =i.get(0).getAdresse_fr();
                tele_producteurs =i.get(0).getTel();
                fax_producteurs =i.get(0).getFax();
                mail_producteurs =i.get(0).getMail();
                lieu_procede_producteurs =i.get(0).getLieu_fr();

            }


        }

        if(ns.getProducteur()!=null){
            Producteur p = ns.getProducteur();
            nom_producteur = p.getNom_fr();
            adresse_producteur =p.getAdresse_fr();
            tele_producteur =p.getTel();
            fax_producteur =p.getFax();
            mail_producteur =p.getMail();
            lieu_procede_producteur =p.getLieu_fr();
        }

        //========

        if(ns.getZf_et().equals("XD")){
            par10.add(new Phrase("9.Producteur(s) des déchets (1) (7) (8) ",fontbold));
            par10.add("N° d'enregistrement:");
            par10.add(Chunk.NEWLINE);

            /*par10.add("Nom de la société : ");
            par10.add(nom_producteurs);
            par10.add(Chunk.NEWLINE);*/

            par10.add("Adresse : ");
            par10.add(adresse_producteurs);
            par10.add(Chunk.NEWLINE);


            par10.add("Tél : ");
            par10.add(tele_producteurs);
            par10.add(Chunk.NEWLINE);

            par10.add("Télécopie : ");
            par10.add(fax_producteurs);
            par10.add(Chunk.NEWLINE);

            par10.add("Courrier éléctronique : ");
            par10.add(mail_producteurs);
            par10.add(Chunk.NEWLINE);

            par10.add("Lieu et procede de production : ");
            par10.add(lieu_procede_producteurs);
            par10.add(Chunk.NEWLINE);
        }

        else{
            par10.add(new Phrase("9.Producteur des déchets (1) (7) (8) ",fontbold));
            par10.add("N° d'enregistrement:");
            par10.add(Chunk.NEWLINE);

            if(!ns.getZf_et().equals("XD")){
                par10.add("Nom de la société : ");
                par10.add(nom_producteur);
                par10.add(Chunk.NEWLINE);
            }

            par10.add("Adresse : ");
            par10.add(adresse_producteur);
            par10.add(Chunk.NEWLINE);


            par10.add("Téléphone : ");
            par10.add(tele_producteur);
            par10.add(Chunk.NEWLINE);

            par10.add("Télécopie : ");
            par10.add(fax_producteur);
            par10.add(Chunk.NEWLINE);

            par10.add("Courrier éléctronique : ");
            par10.add(mail_producteur);
            par10.add(Chunk.NEWLINE);

            par10.add("Lieu et procede de production : ");
            par10.add(lieu_procede_producteur);
            par10.add(Chunk.NEWLINE);
        }


        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(7);
        //========
        String carateristiques_physique = "";
        if(ns.getCaracteristquePhysique() != null){
            CaracteristquePhysique c = ns.getCaracteristquePhysique();
            carateristiques_physique = c.getNom_fr();
        }
        //========

        par11.add(new Phrase("13.Caractéristiques physique (5) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add(carateristiques_physique);

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par12=new Paragraph(13);
        par12.setFont(font);
        par12.setSpacingAfter(7);

        String nom_entreprise ="";
        String address_entreprise ="";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant i = ns.getImportateur();
            nom_entreprise = i.getNom_fr();
            address_entreprise =i.getAdresse_fr();

        }

        if(isElimination){
            par12.add(new Phrase("10. Installation de valorisation / élimination ",fontbold));
            //AddCondition to check or no
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation  (2) ",fontbold));
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
        }else{
            par12.add(new Phrase("10. Installation de valorisation / élimination ",fontbold));
            //AddCondition to check or no
            par12.add(uncheckedChunk);
            par12.add(Chunk.NEWLINE);
            par12.add("ou");
            par12.add(Chunk.NEWLINE);
            par12.add(new Phrase("Installation de valorisation (2)  ",fontbold));
            par12.add(checkedChunk);
            par12.add(Chunk.NEWLINE);
        }


        if(!ns.getZf_et().equals("XD")){
            par12.add("Nom de la société : ");
            par12.add(ns.getEliminateur().getNom_fr());
            par12.add(Chunk.NEWLINE);
        }

        par12.add("Adresse : ");
        par12.add(ns.getEliminateur().getAdresse_fr());
        par12.add(Chunk.NEWLINE);

        par12.add("Téléphone : ");
        par12.add(ns.getEliminateur().getTel());
        par12.add(Chunk.TABBING);

        par12.add("Fax : ");
        par12.add(ns.getEliminateur().getFax());
        par12.add(Chunk.NEWLINE);

        par12.add("Courrier éléctronique : ");
        par12.add(ns.getEliminateur().getMail());
        par12.add(Chunk.NEWLINE);

        par12.add("Lieu effectif de l'élimination/de la valorisation : ");
        par12.add("");
        par12.add(Chunk.NEWLINE);




        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par13=new Paragraph(13);
        par13.setFont(font);
        par13.setSpacingAfter(7);

        par13.add(new Phrase("14. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add("i) Convention de Bale.Annex 8(ou 9 s'il y a lieu) : B3140");
        par13.add(Chunk.NEWLINE);
        par13.add("ii) CODE. OCDE [si différent fe i)]");
        par13.add(Chunk.NEWLINE);
        par13.add("iii) Liste des déchets dans la CE :"+ns.getCodeCE());
        par13.add(Chunk.NEWLINE);
        par13.add("iv) Code national dans le pays d'éxportation :"+ns.getCodeNationalXD());
        par13.add(Chunk.NEWLINE);
        /*par13.add("iv) Code national dans le pays d'importation :"+ns.getCodeNationalIm());
        par13.add(Chunk.NEWLINE);*/
        par13.add("v) Code National(Catalogue Marocain des déchets) : ");
        par13.add(ns.getCode().getNom_fr());
        par13.add(Chunk.NEWLINE);
        par13.add("vi) Autres(préciser) : ");
        par13.add(Chunk.NEWLINE);
        par13.add("vii) CODE Y : -");
        par13.add(Chunk.NEWLINE);
        par13.add("viii) CODE H(1) : "+ns.getCodeH());
        par13.add(Chunk.NEWLINE);
        par13.add("ix) Classe ONU (1) : ");
        par13.add(Chunk.NEWLINE);
        par13.add("x) N° d'identification : ");
        par13.add(Chunk.NEWLINE);
        par13.add("xi) Dénomination ONU : ");
        par13.add(Chunk.NEWLINE);
        par13.add("xii) Code(s) des douane(s) (SH) : ");

        cell = new PdfPCell();
        cell.addElement(par13);
        cell.setColspan(5);
        table.addCell(cell);


        Paragraph par14=new Paragraph(13);
        par14.setFont(font);
        par14.setSpacingAfter(7);

        par14.add(new Phrase("15.a) Pays/Etats concernés,b) numero de codes des autorisés compétences d'il y a lieu,c) points d'entrée ou de sortie(point de passage frontalier ou port )",font));

        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setColspan(10);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("Pays d'exportation/d'éxpédition",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("Etat(s) de transit (entrée et sortie )",font));
        cell.setColspan(6);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("Pays d'importation/ de destination",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("a)  "+ns.getPays().getNom_fr(),font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase(ns.getAutorite().getPays().getNom_fr(),font));        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase(" ",font));
        cell.setColspan(2);
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase(" ",font));
        cell.setColspan(2);
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase(ns.getDestination_final(),font));        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("b)",font));
        cell.setColspan(2);;
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);;
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);;
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);


        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("c)",font));
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase(ns.getPorts().get(0).getNom_fr(),font));
        table.addCell(cell);

        cell = new PdfPCell();
        if(ns.getPorts().size()>1){
            cell.addElement(new Phrase(ns.getPorts().get(1).getNom_fr(),font));
        }
        else{
            cell.addElement(new Phrase("",font));
        }
        table.addCell(cell);

        cell = new PdfPCell();
        if(ns.getPorts().size()>2){
            cell.addElement(new Phrase(ns.getPorts().get(2).getNom_fr(),font));
        }
        else{
            cell.addElement(new Phrase("",font));
        }
        table.addCell(cell);

        cell = new PdfPCell();
        if(ns.getPorts().size()>3){
            cell.addElement(new Phrase(ns.getPorts().get(3).getNom_fr(),font));
        }
        else{
            cell.addElement(new Phrase("",font));
        }
        table.addCell(cell);



        cell = new PdfPCell();
        if(ns.getPorts().size()>4){
            cell.addElement(new Phrase(ns.getPorts().get(4).getNom_fr(),font));
        }
        else{
            cell.addElement(new Phrase("",font));
        }
        table.addCell(cell);

        cell = new PdfPCell();
        if(ns.getPorts().size()>5){
            cell.addElement(new Phrase(ns.getPorts().get(5).getNom_fr(),font));
        }
        else{
            cell.addElement(new Phrase("",font));
        }
        table.addCell(cell);

        cell = new PdfPCell();
        cell.addElement(new Phrase("",font));
        cell.setColspan(2);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(7);
        //========
        String bureau_douane="";
        //========



        par18.add(new Phrase("16.Bureau de douane d'entrée et/ou de sortie et/ou d'exportation (Communauté européenne) :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par18);
        table.addCell(cellMerged);

        Paragraph par018=new Paragraph(13);
        par018.setFont(font);
        par018.setSpacingAfter(7);
        //========
        par018.add("Entrée :");
        par018.add(Chunk.TABBING);
        par018.add(Chunk.TABBING);
        par018.add("Sortie :");
        par018.add(Chunk.TABBING);
        par018.add(Chunk.TABBING);
        par018.add("Exportation :");
        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par20=new Paragraph(11);
        par20.setFont(font);
        par20.setSpacingAfter(7);
        par20.add(new Phrase("15.Declaration de l'exportateur/du notifiant/du producteur (1) : ",fontbold));
        par20.add(Chunk.NEWLINE);
        par20.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement transfrontière est ou  sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises .");
        par20.add(Chunk.NEWLINE);

        par20.add("Nom de l'exportateur/ du notifiant : ");
        par20.add(nom_importateur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(dateFormat.format(new Date()));
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(new Chunk(glue));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom du producteur : ");
        par20.add(nom_producteur);
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(dateFormat.format(new Date()));
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(new Chunk(glue));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par20);
        table.addCell(cellMerged);

        //Paragraph ==========================
        Paragraph par21=new Paragraph(13);
        par21.setFont(font);
        par21.setSpacingAfter(7);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("RESERVE AUX AUTORITES COMPETANTES",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par21);
        table.addCell(cellMerged);


        //Paragraph ==========================
        Paragraph par22=new Paragraph(13);
        par22.setFont(font);
        par22.setSpacingAfter(7);
        //========
        String notification_recu=ns.getDate_reel()==null?"":dateFormat.format(ns.getDate_reel());


        //========


        par22.add(new Phrase("19.Accusé de réception delivré par l'autorité compétente des pays d'importation - de destination / de transit (1) / d'exportation - d'expédition (9) : ",fontbold));
        par22.add(Chunk.NEWLINE);

        par22.add("Pays : ");
        par22.add("");
        par22.add(Chunk.NEWLINE);

        par22.add("Notification reçue le : ");
        par22.add(notification_recu);
        par22.add(Chunk.NEWLINE);

        par22.add("Accusé de réception transmis le : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de l'autorité compétente  : ");
        par22.add(" ------------- ");
        par22.add(Chunk.NEWLINE);
        par22.add("Cachet et/ou signature  : ");
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
//        par23.setSpacingAfter(7);

        par23.add(new Phrase("20.Consentement écrit (1) (8) au mouvement accordé par l'autorité compétente de (pays)",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement accordé le : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Consentement valable du :                            ");
        par23.add("au :                                     ");
        par23.add(Chunk.NEWLINE);

        par23.add("Conditions particulières : ");
        par23.add(oui);
        //Add Condition to check to uncheck
        par23.add(uncheckedChunk);
        par23.add("      ");
        par23.add(non);
        //Here Also
        par23.add(uncheckedChunk);
        par23.add(Chunk.NEWLINE);
        par23.add("Nom de l'autorité compétente  : ");
        par23.add(" ------------- ");
        par23.add(Chunk.NEWLINE);
        par23.add("Cachet et/ou signature  : ");
        par23.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setColspan(5);
        table.addCell(cell);

        //Paragraph ==========================
        Paragraph par024=new Paragraph(13);
        par024.setSpacingAfter(7);
        par024.add(new Phrase("21.Conditions particulieresau consentement ou raisons de l'objection :",fontbold));

        cellMerged = new PdfPCell();
        cellMerged.setColspan(10);
        cellMerged.addElement(par024);
        table.addCell(cellMerged);
        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add("(1) Requis par la convention de Bale .");
        par24.add(Chunk.NEWLINE);
        par24.add("(2) En cas d'operation R12/R13 ou D13-D15, joindre aussi s'il y a lieu les renseignement correspondants sur les installation R12/R13 ou D13-D15 concernés et les installation R1-R11 ou D1-D12 concernés ");
        par24.add(Chunk.NEWLINE);
        par24.add("(3) A remplir pour les mouvement dans la zone de l'OCDE et seulement dans les cas visés par B ii). ");
        par24.add(Chunk.NEWLINE);
        par24.add("(4) Joindre une liste détaillée en cas de transferts multiples . ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setColspan(5);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par25=new Paragraph(12);
        par25.setFont(font);
        par25.setSpacingAfter(4);

        par25.add("(5) Voir les codes dans la liste des abréviation et codes ci-jointe .");
        par25.add(Chunk.NEWLINE);
        par25.add("(6) Joindre des renseignements plus détaillés s'il y a lieu . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(7) Joindre des liste s'il y a plusieurs producteurs . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(8) Si la légalisation nationale l'exige ");
        par25.add(Chunk.NEWLINE);
        par25.add("(9) Le Cas échéant dans le cadre de la décision de l'OCDE . ");
        par25.add(Chunk.NEWLINE);
        par25.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par25);
        cell.setColspan(5);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        table.addCell(cell);

        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentDeMouvement2(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy");
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(base,12.0f);
        Font font=new Font(base,8.0f);
        Font fontTitre = new Font(base,8.0f,Font.BOLD);
        Font fontbold=new Font(base,8.0f);
        Font fontBox = new Font(base2, 8.0f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph();
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add(new Phrase("Document de mouvements des déchets dangereux vers L’installation de traitement ou d’élimination.",fontH1));
        headerPar.setSpacingAfter(7);
        headerPar.setExtraParagraphSpace(12);

        //Declaring Table
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);

        //Paragraph ====

        Paragraph par1= new Paragraph();
        par1.setFont(font);
        par1.setSpacingAfter(5);
        //=========
        String numero_notification=ns.getNum_notification().equals("")?"":ns.getNum_notification();
        String numero_serie=(ns.getSerie()==null||ns.getSerie().equals(""))?"":ns.getSerie();
        //=========
        par1.add(new Phrase("1. Correspondant à la notification No. : ",fontbold));
        par1.add(numero_notification);
        par1.add(Chunk.TABBING);
        par1.add(Chunk.TABBING);
        par1.add(new Phrase("2. No. De série de l'expédition/nombre total d'expéditions : ",fontbold));
        par1.add(numero_serie);

        PdfPCell cell=new PdfPCell();
        cell.addElement(par1);
        cell.setPaddingTop(-2);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par2=new Paragraph(12);
        par2.setFont(font);
        par2.setSpacingAfter(3);
        //========
        String nom_importateur = "";
        String adresse_importateur = "";
        String persone_a_contacte_importateur ="";
        String tele_importateur = "";
        String fax_importateur = "";
        String email_importateur = "";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant np = ns.getImportateur();
            nom_importateur =np.getNom_fr();
            adresse_importateur = np.getAdresse_fr();
            persone_a_contacte_importateur = np.getContact_fr();
            tele_importateur = np.getTel();
            fax_importateur = np.getFax();
            email_importateur = np.getMail();
        }
        //========

        par2.add(new Phrase("3. Importateur – Notifiant :  ",fontbold));
        par2.add(Chunk.NEWLINE);

        par2.add("Nom de la société : ");
        par2.add(nom_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Adresse : ");
        par2.add(adresse_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Personne a contacter : ");
        par2.add(persone_a_contacte_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Tel : ");
        par2.add(tele_importateur);
        par2.add(new Chunk(glue));

        par2.add("Fax : ");
        par2.add(fax_importateur);
        par2.add(new Chunk(glue));

        par2.add("Mail : ");
        par2.add(email_importateur);
        par2.add(new Chunk(glue));

        cell=new PdfPCell();
        cell.addElement(par2);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par3=new Paragraph(12);
        par3.setFont(font);
        par3.setSpacingAfter(5);
        //========

        par3.add(new Phrase("4. Quantité réelle : ",fontbold));
        par3.add(Chunk.TABBING);
        par3.add("Mg (tonnes) : ");
        par3.add(Chunk.TABBING);
        par3.add(Chunk.TABBING);
        par3.add("m3 : ");

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par4=new Paragraph(12);
        par4.setFont(font);
        par4.setSpacingAfter(5);

        par4.add(new Phrase("5. Date réelle de l'expédition : ",fontbold));
        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setPaddingTop(-2);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(3);
        //========
        boolean isprescription=true;//ns.getPrescription().equalsIgnoreCase("oui");

        //========
        par5.add(new Phrase("6. Conditionnement",fontbold));
        par5.add(Chunk.TABBING);
        par5.add("Type(s)  (3) : ");
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add("Nombre de colis :");
        par5.add(Chunk.NEWLINE);
        par5.add(new Phrase("Prescriptions particulières de manutention (2) :",fontbold));
        par5.add(Chunk.TABBING);
        par5.add(oui);
        par5.add(uncheckedChunk);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add(non);
        par5.add(uncheckedChunk);

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par6=new Paragraph(12);
        par6.setFont(font);
        par6.setSpacingAfter(3);

        String nom_transporteur ="";
        String adresse_transporteur ="";
        String tele_transporteur ="";
        String fax_transporteur ="";
        String email_transporteur ="";

        if(ns.getTransporteur()!=null){
            List<TransporteurParam> i = ns.getTransporteur();
            if(i.size()>0){

                nom_transporteur = i.get(0).getNom();
                adresse_transporteur =i.get(0).getAdresse();
                tele_transporteur =i.get(0).getTel();
                fax_transporteur =i.get(0).getFax();
                email_transporteur =i.get(0).getAdresse();

            }


        }

        par6.add(new Phrase("7. a) 1er transporteur  : ",fontbold));
        par6.add(Chunk.NEWLINE);

        par6.add("Nom de la société : "+nom_importateur);
        par6.add(Chunk.NEWLINE);

        par6.add("Adresse : "+adresse_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Personne a contacter : "+ns.getPersonne());
        par6.add(Chunk.NEWLINE);

        par6.add("Tel : "+tele_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Fax : "+fax_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Mail : "+email_importateur);
        par6.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par7=new Paragraph(12);
        par7.setFont(font);
        par7.setSpacingAfter(3);
        par7.add(new Phrase("7. b) 2ème transporteur : ",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("Nom de la société : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Tel : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Fax : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Mail : ");
        par7.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par7);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par8=new Paragraph(12);
        par8.setFont(font);
        par8.setSpacingAfter(3);
        par8.add(new Phrase("7. c) Dernier transporteur : ",fontbold));
        par8.add(Chunk.NEWLINE);

        par8.add("Nom de la société : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Adresse : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Personne a contacter : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Tel : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Fax : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Mail : ");
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par9=new Paragraph();
        par9.setSpacingAfter(4);
        par9.add(new Phrase(" - - - - - - A remplir par le représentant du transporteur - - - - - -",fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        cell=new PdfPCell();
        cell.setPaddingTop(-6);
        cell.addElement(par9);
//      cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(4);

        par10.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add("Date de la prise en charge : ");
        par10.add(Chunk.NEWLINE);
        par10.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(4);

        par11.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add("Date de la prise en charge : ");
        par11.add(Chunk.NEWLINE);
        par11.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par12=new Paragraph(12);
        par12.setFont(font);
        par12.setSpacingAfter(4);

        par12.add(new Phrase("Moyen de transport (5) : ",fontbold));
        par12.add(Chunk.NEWLINE);
        par12.add("Date de la prise en charge : ");
        par12.add(Chunk.NEWLINE);
        par12.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par13=new Paragraph(12);
        par13.setFont(font);
        par13.setSpacingAfter(4);

        String nom_producteur ="";
        String adresse_producteur ="";
        String tele_producteur ="";
        String fax_producteur ="";
        String mail_producteur ="";
        String lieu_procede_producteur ="";

        if(ns.getProducteur()!=null){
            Producteur p = ns.getProducteur();
            nom_producteur = p.getNom_fr();
            adresse_producteur =p.getAdresse_fr();
            tele_producteur =p.getTel();
            fax_producteur =p.getFax();
            mail_producteur =p.getMail();
            lieu_procede_producteur =p.getLieu_fr();
        }

        par13.add(new Phrase("8. Producteur(s) des déchets : ",fontbold));
        par13.add(Chunk.NEWLINE);

        par13.add("Nom de la société : "+nom_producteur);
        par13.add(Chunk.NEWLINE);

        par13.add("Adresse : "+adresse_producteur);
        par13.add(Chunk.NEWLINE);

        par13.add("Tel : "+tele_producteur);
        par13.add(Chunk.TABBING);

        par13.add("Fax : "+fax_producteur);
        par13.add(Chunk.TABBING);
        par13.add(Chunk.NEWLINE);

        par13.add("Mail : "+mail_producteur);
        par13.add(Chunk.NEWLINE);

        par13.add("Lieu de production (2) : "+lieu_procede_producteur==null?"":lieu_procede_producteur);
        par13.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par13);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par14=new Paragraph(12);
        par14.setFont(font);
        par14.setSpacingAfter(4);

        par14.add(new Phrase("11. Dénomination et composition des déchets  : ",fontbold));
        par14.add(new Phrase(ns.getCode().getNom_ar(),fontbold));

        par14.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par15=new Paragraph(12);
        par15.setFont(font);
        par15.setSpacingAfter(4);

        par15.add(new Phrase("12. Caractéristiques physiques (6) : ",fontbold));
        par15.add(new Phrase(ns.getCaracteristquePhysique().getNom_fr(),fontbold));
        par15.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par15);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);
//Paragraph ====
        Paragraph par16=new Paragraph(12);
        par16.setFont(font);
        par16.setSpacingAfter(5);

        par16.add(new Phrase("9. Installation de valorisation / élimination :  ",fontbold));
        par16.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("ou",fontbold));
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("de valorisation (2):   ",fontbold));
        par16.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.NEWLINE);

        par16.add("Nom de la société : "+ns.getEliminateur().getNom_fr());
        par16.add(Chunk.NEWLINE);

        par16.add("Adresse : "+ns.getEliminateur().getAdresse_fr());
        par16.add(Chunk.NEWLINE);

        par16.add("Tél : "+ns.getEliminateur().getTel());
        par16.add(Chunk.TABBING);

        par16.add("Fax : "+ns.getEliminateur().getFax());
        par16.add(Chunk.TABBING);
        par16.add(Chunk.NEWLINE);

        par16.add("Mail : "+ns.getEliminateur().getMail());
        par16.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par16);
        cell.setPaddingTop(-2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par17=new Paragraph(15);
        par17.setFont(font);
        par17.setSpacingAfter(4);

        par17.add(new Phrase("13. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par17.add(Chunk.NEWLINE);
        par17.add("Convention de Bale.Annex 8(ou 9 s'il y a lieu) : ");
        par17.add("CONV. BALE");
        par17.add(Chunk.NEWLINE);
        par17.add("Code National(Catalogue Marocain des déchets) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("Code H : ");
        par17.add(ns.getCodeH());
        par17.add(Chunk.NEWLINE);
        par17.add("Code(s) des douanes (SH) : ");
        par17.add("");
        par17.add(Chunk.NEWLINE);
        par17.add("Autre (preciser) : ");
        par17.add("");

        cell = new PdfPCell();
        cell.addElement(par17);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(4);

        par18.add(new Phrase("10. Opération d'élimination/valorisation",fontbold));
        par18.add(Chunk.NEWLINE);
        par18.add("Code D (1)  / R (2) : "+ns.getOperationdelimination());

        cell = new PdfPCell();
        cell.addElement(par18);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par19=new Paragraph(13);
        par19.setFont(font);
        par19.setSpacingAfter(4);

        par19.add(new Phrase("14. Déclaration de l'importateur / producteur  : ",fontbold));

        par19.add(Chunk.NEWLINE);
        par19.add("    Je soussigné certifie que les renseignements  indiques sont exacts et établis de bonne foi." +
                " Je certifie également que le mouvement des déchets sera couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises notamment l'assurance de transport des déchets dangereuses.");
        par19.add(Chunk.NEWLINE);

        par19.add("Nom de la société : ");
        par19.add(new Chunk(glue));
        par19.add("Date : ");
        par19.add(new Chunk(glue));
        par19.add("Signature : ");
        par19.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par19);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par20=new Paragraph(12);
        par20.setFont(font);
        par20.setSpacingAfter(4);

        par20.add(new Phrase("15. Expédition reçue l’installation de valorisation/élimination : ",fontbold));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom de la société : ");
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par20);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par21=new Paragraph(12);
        par21.setSpacingAfter(4);
        cell.setPaddingTop(-10.0f);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("A REMPLIR PAR L'INSTALLATION DE VALORISATION / ELIMINATION",fontbold));

        cell = new PdfPCell();
        cell.addElement(par21);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par22=new Paragraph(12);
        par22.setFont(font);
        par22.setSpacingAfter(4);

        par22.add(new Phrase("16. Expédition reçue à l'Installation de valorisation / élimination ",fontbold));
        par22.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add(new Phrase("ou de valorisation (2) :   ",fontbold));
        par22.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Date de reception : ");
        par22.add(Chunk.TABBING);
        par22.add("Acceptée : ");
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add("Rejetée* : ");
        par22.add(uncheckedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Quantité reçue : ");
        par22.add("Tonnes : ");
        par22.add(Chunk.TABBING);
        par22.add("m3 : ");
        par22.add(Chunk.NEWLINE);
        par22.add("* contacter immédiatement les autorités compétentes");
        par22.add(Chunk.NEWLINE);

        par22.add("Date approximative d'élimination/valorisation :");
        par22.add(Chunk.NEWLINE);

        par22.add("Opération d'élimination/valorisation (1 et 2) :");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de la société : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Date : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Signature : ");
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);

        par23.add(new Phrase("17. Je soussigné certifie que l'élimination/la valorisation des déchets décrits ci-dessus a été effectuée.",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Nom de la société : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Date : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Signature et Cachet : ");
        par23.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //empty Cell

        cell = new PdfPCell(new Phrase("\n"));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(6);
        table.addCell(cell);



        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add(new Phrase("18. Zone Franche d’importation ou Bureau de douane d’entrée",fontbold));
        par24.add(Chunk.NEWLINE);
        par24.add("Les déchets décrits dans ce document de mouvement ont quitté la Zone Franche le : ");
        par24.add(Chunk.NEWLINE);
        par24.add("Signature : ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);
        par24.add("Cachet : ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);


        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateDocumentDeMouvement(Notification ns) throws DocumentException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();
        DateFormat df = new SimpleDateFormat("dd-mm-yyyy");
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(base,14.0f);
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base2, 13.0f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph();
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add(new Phrase("Document de mouvements des déchets dangereux pour mouvement /transferts transfrontières de déchets.",fontH1));
        headerPar.setSpacingAfter(7);
        headerPar.setExtraParagraphSpace(12);

        //Declaring Table
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);

        //Paragraph ====

        Paragraph par1= new Paragraph();
        par1.setFont(font);
        par1.setSpacingAfter(5);
        //=========
        String numero_notification=ns.getNum_notification().equals("")?"":ns.getNum_notification();
        String numero_serie=(ns.getSerie()==null||ns.getSerie().equals(""))?"":ns.getSerie();
        //=========
        PdfPCell cell=new PdfPCell();
        cell.addElement(new Phrase("1. Correspondant à la notification No. : "+numero_notification,fontbold));
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        cell=new PdfPCell();
        cell.addElement(new Phrase("2. Numéro de série du transfert/nombre total /"+numero_serie+" transfert: ",fontbold));
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par02=new Paragraph();
        par02.setFont(font);
        par02.setSpacingAfter(3);
        //========
        String nom_importateur = "";
        String adresse_importateur = "";
        String persone_a_contacte_importateur ="";
        String tele_importateur = "";
        String fax_importateur = "";
        String email_importateur = " ";

        if(ns.getImportateur()!=null){
            ImportateurNotifiant np = ns.getImportateur();
            nom_importateur =np.getNom_fr();
            adresse_importateur = np.getAdresse_fr();
            persone_a_contacte_importateur = np.getContact_fr();
            tele_importateur = np.getTel();
            fax_importateur = np.getFax();
            email_importateur = np.getMail();
        }
        //========

        par02.add(new Phrase(ns.getZf_et().equals("XD")?"3. Importateur – Destinataire ":"3. Exportateur – Notifiant ",fontbold));
        par02.add("N° d'enregistrement :  ");
        par02.add(Chunk.NEWLINE);

        if(ns.getZf_et().equals("XD")){
            par02.add("Nom de l'importateur destinataire : ");
        }else if(ns.getZf_et().equals("ET")){
            par02.add("Nom de l'exportateur notifiant : ");
        }else{
            par02.add("Nom de la société : ");
        }

        par02.add(ns.getNom());
        par02.add(Chunk.NEWLINE);

        par02.add("Adresse : ");
        par02.add(ns.getAdresse());
        par02.add(Chunk.NEWLINE);

        par02.add("Personne a contacter : ");
        par02.add(ns.getPersonne());
        par02.add(Chunk.NEWLINE);

        par02.add("Tél : ");
        par02.add(ns.getTel());
        par02.add(Chunk.NEWLINE);

        par02.add("Télécopie : ");
        par02.add(ns.getTelecopie());
        par02.add(Chunk.NEWLINE);

        par02.add("Courier éléctronique : ");
        par02.add(ns.getCourrier());
        par02.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par02);
        cell.setPadding(3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par2=new Paragraph();
        par2.setFont(font);
        par2.setSpacingAfter(3);
        //========

        par2.add(new Phrase(ns.getZf_et().equals("XD")?"4. Exportateur – Notifiant ":"4. Importateur – Notifiant ",fontbold));
        par2.add("N° d'enregistrement :  ");
        par2.add(Chunk.NEWLINE);

        par2.add("Nom de la société : ");
        par2.add(nom_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Adresse : ");
        par2.add(adresse_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Personne à contacter : ");
        par2.add(persone_a_contacte_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Tél : ");
        par2.add(tele_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Télécopie : ");
        par2.add(fax_importateur);
        par2.add(Chunk.NEWLINE);

        par2.add("Courrier électronique : ");
        par2.add(email_importateur);
        par2.add(Chunk.NEWLINE);

        cell=new PdfPCell();
        cell.addElement(par2);
        cell.setPadding(3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par3=new Paragraph();
        par3.setFont(font);
        par3.setSpacingAfter(5);
        //========

        par3.add(new Phrase("5. Quantité réelle : ",fontbold));
        par3.add(Chunk.TABBING);

        cell = new PdfPCell();
        cell.addElement(par3);
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par4=new Paragraph();
        par4.setFont(font);
        par4.setSpacingAfter(5);
        //========


        par4.add(new Phrase("6. Date réelle du transfert : ",fontbold));
        cell = new PdfPCell();
        cell.addElement(par4);
        cell.setPadding(2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par5=new Paragraph(12);
        par5.setFont(font);
        par5.setSpacingAfter(3);
        //========
        boolean isprescription=true;//ns.getPrescription().equalsIgnoreCase("oui");

        //========
        par5.add(new Phrase("7. Conditionnement",fontbold));
        par5.add(Chunk.TABBING);
        par5.add("Type(s)  (1) : ");
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add("Nombre de colis :");
        par5.add(Chunk.NEWLINE);
        par5.add(new Phrase("Prescriptions particulières de manutention (2) :",fontbold));
        par5.add(Chunk.TABBING);
        par5.add(oui);
        par5.add(uncheckedChunk);
        par5.add(Chunk.TABBING);
        par5.add(Chunk.TABBING);
        par5.add(non);
        par5.add(uncheckedChunk);

        cell = new PdfPCell();
        cell.addElement(par5);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par6=new Paragraph(12);
        par6.setFont(font);
        par6.setSpacingAfter(3);

        String nom_transporteur ="";
        String adresse_transporteur ="";
        String tele_transporteur ="";
        String fax_transporteur ="";
        String email_transporteur ="";

        if(ns.getTransporteur()!=null){
            List<TransporteurParam> i = ns.getTransporteur();
            if(i.size()>0){

                nom_transporteur = i.get(0).getNom();
                adresse_transporteur =i.get(0).getAdresse();
                tele_transporteur =i.get(0).getTel();
                fax_transporteur =i.get(0).getFax();
                email_transporteur =i.get(0).getAdresse();

            }


        }

        par6.add(new Phrase("8. a) 1er transporteur  : ",fontbold));
        par6.add(Chunk.NEWLINE);

        par6.add("N° d'enregistrement : ");
        par6.add("");
        par6.add(Chunk.NEWLINE);

        par6.add("Nom de la société : ");
        par6.add(nom_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Adresse : ");
        par6.add(adresse_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Tél : ");
        par6.add(tele_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Télecopie : ");
        par6.add(fax_transporteur);
        par6.add(Chunk.NEWLINE);

        par6.add("Courrier électronique : ");
        par6.add(email_transporteur);
        par6.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par6);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par7=new Paragraph(12);
        par7.setFont(font);
        par7.setSpacingAfter(3);

        par7.add(new Phrase("8. b) 2ème transporteur : ",fontbold));
        par7.add(Chunk.NEWLINE);

        par7.add("N° d'enregistrement : ");
        par7.add("");
        par7.add(Chunk.NEWLINE);

        par7.add("Nom de la société : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Adresse : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Personne a contacter : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Tél : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Télécopie : ");
        par7.add(Chunk.NEWLINE);

        par7.add("Courrier électronique : ");
        par7.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par7);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par8=new Paragraph(12);
        par8.setFont(font);
        par8.setSpacingAfter(3);


        par8.add(new Phrase("7. c) Dernier transporteur : ",fontbold));
        par8.add(Chunk.NEWLINE);

        par8.add("N° d'enregistrement : ");
        par8.add("");
        par8.add(Chunk.NEWLINE);

        par8.add("Nom de la société : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Adresse : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Personne a contacter : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Tél : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Télécopie : ");
        par8.add(Chunk.NEWLINE);

        par8.add("Courrier électronique : ");
        par8.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par8);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par9=new Paragraph();
        par9.setSpacingAfter(4);
        par9.add(new Phrase(" - - - - - - A remplir par le représentant du transporteur - - - - - -",fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        par9.add(Chunk.TABBING);
        par9.add(Chunk.TABBING);
        par9.add(new Phrase("Plus de trois transporteurs(2) ",font));
        par9.add(isprescription?uncheckedChunk:checkedChunk);


        cell=new PdfPCell();
        cell.setPaddingTop(-6);
        cell.addElement(par9);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par10=new Paragraph(13);
        par10.setFont(font);
        par10.setSpacingAfter(4);
        par10.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par10.add(Chunk.NEWLINE);
        par10.add("Date de la prise en charge : ");
        par10.add(Chunk.NEWLINE);
        par10.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par10);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par11=new Paragraph(13);
        par11.setFont(font);
        par11.setSpacingAfter(4);
        par11.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par11.add(Chunk.NEWLINE);
        par11.add("Date de la prise en charge : ");
        par11.add(Chunk.NEWLINE);
        par11.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par11);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====

        Paragraph par12=new Paragraph(12);
        par12.setFont(font);
        par12.setSpacingAfter(4);
        par12.add(new Phrase("Moyen de transport (1) : ",fontbold));
        par12.add(Chunk.NEWLINE);
        par12.add("Date de la prise en charge : ");
        par12.add(Chunk.NEWLINE);
        par12.add("Signature : ");

        cell = new PdfPCell();
        cell.addElement(par12);
        cell.setPaddingTop(-3);
        cell.setColspan(2);;
        table.addCell(cell);

        //Paragraph ====
        Paragraph par13=new Paragraph(12);
        par13.setFont(font);
        par13.setSpacingAfter(4);

        String nom_producteurs ="";
        String adresse_producteurs ="";
        String persone_a_contacte_producteurs ="";
        String tele_producteurs ="";
        String fax_producteurs ="";
        String mail_producteurs ="";
        String lieu_procede_producteurs ="";

        String nom_producteur ="";
        String adresse_producteur ="";
        String persone_a_contacte_producteur ="";
        String tele_producteur ="";
        String fax_producteur ="";
        String mail_producteur ="";
        String lieu_procede_producteur ="";

        if(ns.getProducteur()!=null){
            nom_producteur = ns.getProducteur().getNom_fr();
            adresse_producteur =ns.getProducteur().getAdresse_fr();
            persone_a_contacte_producteur=ns.getProducteur().getContact_fr();
            tele_producteur =ns.getProducteur().getTel();
            fax_producteur =ns.getProducteur().getFax();
            mail_producteur =ns.getProducteur().getAdresse_fr();
            lieu_procede_producteur=ns.getProducteur().getLieu_fr();
        }
        if(ns.getProducteurs()!=null){
            List<Producteur> i = ns.getProducteurs();
            if(i.size()>0){
                nom_producteurs = i.get(0).getNom_fr();
                adresse_producteurs =i.get(0).getAdresse_fr();
                persone_a_contacte_producteurs=i.get(0).getContact_fr();
                tele_producteurs =i.get(0).getTel();
                fax_producteurs =i.get(0).getFax();
                mail_producteurs =i.get(0).getAdresse_fr();
                lieu_procede_producteurs=i.get(0).getLieu_fr();
            }
        }

        if(ns.getZf_et().equals("XD")){
            par13.add(new Phrase("9. Producteur(s) des déchets (4) (5) (6) ",fontbold));
            par13.add(Chunk.NEWLINE);
            par13.add("N° d'enregistrement : ");
            par13.add("");
            par13.add(Chunk.NEWLINE);

            if(!ns.getZf_et().equals("XD")){
                par13.add("Nom de la société : ");
                par13.add(nom_producteurs);
                par13.add(Chunk.NEWLINE);
            }

            par13.add("Adresse : ");
            par13.add(adresse_producteurs);
            par13.add(Chunk.NEWLINE);

            par13.add("Personne a contacter : ");
            par13.add(persone_a_contacte_producteurs);
            par13.add(Chunk.NEWLINE);

            par13.add("Tél : ");
            par13.add(tele_producteurs);
            par13.add(Chunk.TABBING);

            par13.add("Télécopie : ");
            par13.add(fax_producteurs);
            par13.add(Chunk.TABBING);
            par13.add(Chunk.NEWLINE);

            par13.add("Courier éléctronique : ");
            par13.add(mail_producteurs);
            par13.add(Chunk.NEWLINE);


            par13.add("Lieu de production (2) : ");
            par13.add(lieu_procede_producteurs);
            par13.add(Chunk.NEWLINE);
        }
        else{
            par13.add(new Phrase("9. Producteur des déchets (4) (5) (6) ",fontbold));
            par13.add(Chunk.NEWLINE);
            par13.add("N° d'enregistrement : ");
            par13.add("");
            par13.add(Chunk.NEWLINE);

            if(!ns.getZf_et().equals("XD")) {
                par13.add("Nom de la société : ");
                par13.add(nom_producteur);
                par13.add(Chunk.NEWLINE);
            }

            par13.add("Adresse : ");
            par13.add(adresse_producteur);
            par13.add(Chunk.NEWLINE);

            par13.add("Personne a contacter : ");
            par13.add(persone_a_contacte_producteur);
            par13.add(Chunk.NEWLINE);

            par13.add("Tél : ");
            par13.add(tele_producteur);
            par13.add(Chunk.TABBING);

            par13.add("Télécopie : ");
            par13.add(fax_producteur);
            par13.add(Chunk.TABBING);
            par13.add(Chunk.NEWLINE);

            par13.add("Courier éléctronique : ");
            par13.add(mail_producteur);
            par13.add(Chunk.NEWLINE);


            par13.add("Lieu de production (2) : ");
            par13.add(lieu_procede_producteur);
            par13.add(Chunk.NEWLINE);
        }


        cell=new PdfPCell();
        cell.addElement(par13);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====

        Paragraph par14=new Paragraph(12);
        par14.setFont(font);
        par14.setSpacingAfter(4);
        par14.add(new Phrase("12. Dénomination et composition des déchets  : ",fontbold));
        par14.add(new Phrase(ns.getCode().getNom_ar(),fontbold));
        par14.add(Chunk.NEWLINE);
        par14.add("Composition :");
        par14.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par14);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par15=new Paragraph(12);
        par15.setFont(font);
        par15.setSpacingAfter(4);
        par15.add(new Phrase("13. Caractéristiques physiques (1) : ",fontbold));
        par15.add(new Phrase(ns.getCaracteristquePhysique().getNom_fr(),fontbold));
        par15.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par15);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);
//Paragraph ====
        Paragraph par16=new Paragraph(12);
        par16.setFont(font);
        par16.setSpacingAfter(5);

        String nom_installation ="";
        String adresse_installation ="";
        String persone_a_contacte_installation ="";
        String tele_installation ="";
        String fax_installation ="";
        String mail_installation ="";

        if(ns.getEliminateur()!=null){
            nom_installation = ns.getEliminateur().getNom_fr();
            adresse_installation =ns.getEliminateur().getAdresse_fr();
            persone_a_contacte_installation=ns.getEliminateur().getContact_fr();
            tele_installation =ns.getEliminateur().getTel();
            fax_installation =ns.getEliminateur().getFax();
            mail_installation =ns.getEliminateur().getAdresse_fr();
        }

        par16.add(new Phrase("10. Installation de valorisation / élimination :  ",fontbold));
        par16.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("ou",fontbold));
        par16.add(Chunk.TABBING);
        par16.add(new Phrase("de valorisation (2):   ",fontbold));
        par16.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par16.add(Chunk.NEWLINE);

        par16.add("N° d'enregistrement:");
        par16.add("");
        par16.add(Chunk.NEWLINE);

        if(!ns.getZf_et().equals("XD")) {
            par16.add("Nom de la société : ");
            par16.add(nom_installation);
            par16.add(Chunk.NEWLINE);
        }

        par16.add("Adresse : ");
        par16.add(adresse_installation);
        par16.add(Chunk.NEWLINE);

        par16.add("Personne a contacter : ");
        par16.add(persone_a_contacte_installation);
        par16.add(Chunk.NEWLINE);

        par16.add("Tél : ");
        par16.add(tele_installation);
        par16.add(Chunk.TABBING);

        par16.add("Télécopie : ");
        par16.add(fax_installation);
        par16.add(Chunk.TABBING);
        par16.add(Chunk.NEWLINE);

        par16.add("Courier électronique : ");
        par16.add(mail_installation);
        par16.add(Chunk.NEWLINE);

        par16.add("Lieu effectif de l'élimination/valorisation : ");
        par16.add(Chunk.NEWLINE);


        cell = new PdfPCell();
        cell.addElement(par16);
        cell.setPaddingTop(-2);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par17=new Paragraph(15);
        par17.setFont(font);
        par17.setSpacingAfter(4);

        par17.add(new Phrase("14. Identification des déchets (indiquer les codes correspondants)",fontbold));
        par17.add(Chunk.NEWLINE);
        par17.add("i) Convention de Bale.Annex 8(ou 9 s'il y a lieu) : B3140");
        par17.add(Chunk.NEWLINE);
        par17.add("ii) CODE. OCDE [si différent fe i)]");
        par17.add(Chunk.NEWLINE);
        par17.add("iii) Liste des déchets dans la CE : 16 01 03");
        par17.add(Chunk.NEWLINE);
        par17.add("iv) Code national dans le pays d'éxportation : 16 01 03");
        par17.add(Chunk.NEWLINE);
        /*par17.add("iv) Code national dans le pays d'importation : 16 01 03");
        par17.add(Chunk.NEWLINE);*/
        par17.add("v) Code National(Catalogue Marocain des déchets) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("vi) Autres(préciser) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("vii) CODE Y : -");
        par17.add(Chunk.NEWLINE);
        par17.add("viii) CODE H(1) : "+ns.getCodeH());
        par17.add(Chunk.NEWLINE);
        par17.add("ix) Classe ONU (1) : ");
        par17.add(Chunk.NEWLINE);
        par17.add("x) N° d'identification : ");
        par17.add(Chunk.NEWLINE);
        par17.add("xi) Dénomination ONU : ");
        par17.add(Chunk.NEWLINE);
        par17.add("xii) Code(s) des douane(s) (SH) : 40004 00 00");

        cell = new PdfPCell();
        cell.addElement(par17);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        cell.setRowspan(2);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par18=new Paragraph(13);
        par18.setFont(font);
        par18.setSpacingAfter(4);
        par18.add(new Phrase("11. Opération d'élimination/valorisation",fontbold));
        par18.add(Chunk.NEWLINE);
        par18.add("Code D/ R (1) : R1");
        cell = new PdfPCell();
        cell.addElement(par18);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par19=new Paragraph(13);
        par19.setFont(font);
        par19.setSpacingAfter(4);
        par19.add(new Phrase("15. Déclaration de l'importateur / producteur  : ",fontbold));

        par19.add(Chunk.NEWLINE);
        par19.add("    Je soussigné certifie que les renseignements  portés dans les cases ci-dessus sont exacts et établis de bonne foi." +
                " Je certifie également que le obligation contactuelles écrites prévues pour la réglementation ont été remplis, que le mouvement transfrontière est couvert par toutes les assurances ou " +
                "garanties financières éventuellement requises et que toutes les autorisation requises ont été recues des autorités compétentes des pays concernés.");
        par19.add(Chunk.NEWLINE);

        par19.add("Nom de la société : ");
        par19.add(new Chunk(glue));
        par19.add("Date : ");
        par19.add(new Chunk(glue));
        par19.add("Signature : ");
        par19.add(new Chunk(glue));
        par19.add(Chunk.NEWLINE);

        par19.add(new Phrase("A remplir par toute personne impliqué dans le mouvement transfrontière s'il y a lieu de fournir d'autres renseignement :",fontbold));
        cell = new PdfPCell();
        cell.addElement(par19);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par20=new Paragraph(12);
        par20.setFont(font);
        par20.setSpacingAfter(4);
        par20.add(new Phrase("16. Transfet reçu par l'importateur - le destinataire (autre qu'une installation): ",fontbold));
        par20.add(Chunk.NEWLINE);

        par20.add("Nom de la société : ");
        par20.add(new Chunk(glue));
        par20.add("Date : ");
        par20.add(new Chunk(glue));
        par20.add("Signature : ");
        par20.add(new Chunk(glue));

        cell = new PdfPCell();
        cell.addElement(par20);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par21=new Paragraph(12);
        par21.setSpacingAfter(4);
        cell.setPaddingTop(-10.0f);
        par21.setAlignment(Element.ALIGN_CENTER);
        par21.add(new Phrase("A REMPLIR PAR L'INSTALLATION D'ELIMINATION / VALORISATION",fontbold));

        cell = new PdfPCell();
        cell.addElement(par21);
        cell.setPaddingTop(-3);
        cell.setColspan(6);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par22=new Paragraph(12);
        par22.setFont(font);
        par22.setSpacingAfter(4);
        par22.add(new Phrase("17. Transfert reçu à l'Installation de valorisation / élimination ",fontbold));
        par22.add(ns.getEliminateur()!=null?checkedChunk:uncheckedChunk);
        par22.add(Chunk.TABBING);
        par22.add(new Phrase("ou de valorisation :   ",fontbold));
        par22.add(ns.getEliminateur()==null?checkedChunk:uncheckedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Date de reception : ");
        par22.add(Chunk.TABBING);
        par22.add("Acceptée : ");
        par22.add(checkedChunk);
        par22.add(Chunk.TABBING);
        par22.add("Rejetée* : ");
        par22.add(uncheckedChunk);
        par22.add(Chunk.NEWLINE);
        par22.add("Quantité reçue : ");
        par22.add("Tonnes : ");
        par22.add(Chunk.TABBING);
        par22.add("m3 : ");
        par22.add(Chunk.NEWLINE);
        par22.add("* contacter immédiatement les autorités compétentes");
        par22.add(Chunk.NEWLINE);

        par22.add("Date approximative d'élimination/valorisation :");
        par22.add(Chunk.NEWLINE);

        par22.add("Opération d'élimination - valorisation (1) :");
        par22.add(Chunk.NEWLINE);

        par22.add("Nom de la société : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Date : ");
        par22.add(Chunk.NEWLINE);

        par22.add("Signature : ");
        par22.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par22);
        cell.setPaddingTop(-2);
        cell.setColspan(4);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par23=new Paragraph(13);
        par23.setFont(font);
        par23.add(new Phrase("18. Je soussigné certifie que l'élimination/la valorisation des déchets décrits ci-dessus a été effectuée.",fontbold));
        par23.add(Chunk.NEWLINE);

        par23.add("Nom de la société : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Date : ");
        par23.add(Chunk.NEWLINE);

        par23.add("Signature et Cachet : ");
        par23.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par23);
        cell.setPaddingTop(-3);
        cell.setColspan(2);
        table.addCell(cell);

        //empty Cell

        cell = new PdfPCell(new Phrase("\n"));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(6);
        table.addCell(cell);



        //Paragraph ====
        Paragraph par24=new Paragraph(12);
        par24.setFont(font);
        par24.setSpacingAfter(4);

        par24.add("(1) Voir les codes dans la liste des abréviations et codes ci-jointes .");
        par24.add(Chunk.NEWLINE);
        par24.add("(2) Joindre des renseignement plus détaillés s'il a lieu . ");
        par24.add(Chunk.NEWLINE);
        par24.add("(3) S'il y a plus de trois transporteurs , joindre renseignements prévus aux cases 8 a,b,c ");
        par24.add(Chunk.NEWLINE);
        par24.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par24);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);

        //Paragraph ====
        Paragraph par25=new Paragraph(12);
        par25.setFont(font);
        par25.setSpacingAfter(4);

        par25.add("(4) Requis par la convention de Bale .");
        par25.add(Chunk.NEWLINE);
        par25.add("(5) Joindre une liste s'il y a plusieurs producteurs . ");
        par25.add(Chunk.NEWLINE);
        par25.add("(6) Si la légalisation nationale l'exige ");
        par25.add(Chunk.NEWLINE);
        par25.add(Chunk.NEWLINE);

        cell = new PdfPCell();
        cell.addElement(par25);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(-3);
        cell.setColspan(3);
        table.addCell(cell);


        document.add(headerPar);
        document.add(table);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generate9arar() throws DocumentException {

        String IMAGE = "resources/images/berlin2013.jpg";
        String DEST = "results/images/background_transparent.pdf";

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter.getInstance(document,out);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Setting up the font to be used in Paragraphs
        Font fontH1=new Font(base,14.0f);
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());


        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }


    //******************************************************** Récap **************************************************//



    public static ByteArrayInputStream generateDocumentDInstallation(Installation ns,ListDocNotif[] l,String url) throws DocumentException, IOException {



        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter writer=PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Reçu de dépôt de la demande d'autorisation d'installation de traitement des déchets");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Instalation ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("منشأة معالجة النفايات الخطرة",6));
        table0.addCell(saisir_cellule_titre("Installation de traitement des déchets dangereux",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("وصف المنشأة :",font,3));
        table0.addCell( saisir_cellule_tmp(" : Description d'installation",font,3));
        table0.addCell( MyCell("رقم الطلب :",font,3));
        table0.addCell( saisir_cellule_tmp(" : N° de la demande",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDescription(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),6));
        table0.completeRow();
//        table0.addCell( MyCell("هيكل المنشأة :",font,2));
//        table0.addCell( saisir_cellule_tmp(" : structure d'installation",font,3));
        table0.addCell( MyCell("نوع الجهاز :",font,3));
        table0.addCell( saisir_cellule_tmp(" : Type d'appareil",font,3));
        table0.addCell( MyCell("الموقع  :",font,3));
        table0.addCell( saisir_cellule_tmp(" : Site",font,3));
        table0.completeRow();
//        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getStructure(),5));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getType_appareil(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getSite(),6));
        table0.completeRow();
        table0.addCell( MyCell("الوحدة :",font,2));
        table0.addCell( saisir_cellule_tmp(" : Unité",font,2));
        table0.addCell( MyCell("الكمية :",font,2));
        table0.addCell( saisir_cellule_tmp(": Quantité",font,2));
        table0.addCell( MyCell("العملية :",font,2));
        table0.addCell( saisir_cellule_tmp(":Opération",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation(),4));
        table0.completeRow();


        table0.completeRow();
        //--------------------- Row Title ---------------------

        if(ns.getType().equals("3")){
            table0.addCell(saisir_cellule_transporteur_titre("Code",6));
            table0.addCell(saisir_cellule_transporteur_titre("Type",6));
            table0.completeRow();
            table0.setSpacingAfter(5);
            table0.addCell(MonCellule("vous avez selectionnez toutes la liste", 12));
            table0.completeRow();
        }
        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table1.addCell(saisir_cellule_titre1("معلومات عن صاحب المشروع",6));
        table1.addCell(saisir_cellule_titre("Information sur pétitionnaire",6));
        table1.completeRow();
        //--------------------- completeRow ---------------------

        table1.addCell( MyCell("اسم الشركة : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Nom de la société",font,2));
        table1.addCell( MyCell("البريد الإلكتروني : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Email",font,2));
        table1.addCell( MyCell("الهاتف : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Télephone",font,2));
        table1.completeRow();
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison()!=null?ns.getRaison():"-",4));
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEmail()!=null?ns.getEmail():"-",4));
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTel()!=null?ns.getTel():"-",4));
        table1.completeRow();
        table1.addCell( MyCell("الفاكس : ",font,3));
        table1.addCell( saisir_cellule_tmp(" : Fax",font,3));
        table1.addCell( MyCell("العنوان : ",font,3));
        table1.addCell( saisir_cellule_tmp(" : Adresse",font,3));
        table1.completeRow();
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getFax()!=null?ns.getFax():"-",6));
        table1.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse()!=null?ns.getAdresse():"-",6));
        table1.completeRow();


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(12);
        table2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre1("فريق العمل",6));
        table2.addCell(saisir_cellule_titre("Equipe De Travail",6));
        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( MyCell("عدد الفريق : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Nombre d'equipe",font,2));
        table2.addCell( MyCell("عدد الموظفين : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Nombre d'effectif",font,2));
        table2.addCell( MyCell("ساعات العمل : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Horaire Début d'exploitation",font,2));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getNbr_equipe_travail(),4));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getFormation(),4));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getHoraire_exploitation(),4));
        table2.setSpacingAfter(12);


        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب ",6));
        table7.addCell(saisir_cellule_titre("Pièces accompagnant la demande",6));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }


        PdfPTable table8 = new PdfPTable(4);
        table8.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table8.setWidthPercentage(100);
        table8.setSpacingBefore(12);
        table8.setSpacingAfter(12);
        table8.addCell(saisir_cellule_titre1("تاريخ الإيداع" ,2));
        table8.addCell(saisir_cellule_titre("Date de dépôt " ,2));
        table8.completeRow();
        //--------------------- completeRow ---------------------
        //--------------------- completeRow ---------------------

        String dateTest=convertDate("dd/MM/yyyy",ns.getDateDepot());
        table8.addCell( saisir_cellule2("Date de dépôt de la demande :",font,fontbold,dateTest,4));
        table8.completeRow();
        table8.setSpacingAfter(100);

        Paragraph p = new Paragraph();
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        p.add(Chunk.NEWLINE);
        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_pdf_installation/"
                + ns.getId_installation(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);


        document.add(headerPar);
        document.add(table0);
        document.add(table1);
        document.add(table2);
        if(ns.getType().equals("1") || ns.getType().equals("2")){
            PdfPTable table_x = new PdfPTable(4);
            table_x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
            table_x.setWidthPercentage(100);
            table_x.setSpacingBefore(12);
            table_x.setSpacingAfter(12);
            table_x.addCell(saisir_cellule_titre1("المصنف المغربي النفايات",2));
            table_x.addCell(saisir_cellule_titre("Catalogue Marocain des déchets",2));
            table_x.completeRow();
            if(ns.getType().equals("1")) {
                table_x.addCell(MonCellule("Vous avez selectionnez tous les codes à l'exception de la liste ci-dessous", 4));
                table_x.completeRow();
            }
            table_x.addCell(saisir_cellule_transporteur_titre("Code",2));
            table_x.addCell(saisir_cellule_transporteur_titre("Type",2));
            table_x.completeRow();
            table_x.setSpacingAfter(5);

            //--------------------- completeRow ---------------------
            for (Code c:ns.getCode()){
                table_x.addCell(saisir_cellule("",font,font,c.getNom_fr()!=null?RTL_LTR(c.getNom_fr()):"-",2));
                table_x.addCell(saisir_cellule("",font,font,c.getNom_ar()!=null?c.getNom_ar():"-",2));
                table_x.completeRow();
            }
            document.add(table_x);

        }

        document.add(table7);
        addFooter(writer,codeQrImage);
        document.add(table8);
        //addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateRecapInstalation(Installation ns,ListDocNotif[] l, DocImport[] d,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 40, 40, 30, 0);
        PdfWriter writer=PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font font_sm=new Font(base,8.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);
        Font BlackText = new Font(base,10,Font.NORMAL,BaseColor.BLACK);


        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Récapitulation de la demande d'autorisation d'installation de traitement des déchets");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Instalation ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("منشأة معالجة النفايات",6));
        table0.addCell(saisir_cellule_titre("Installation de traitement des déchets",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("وصف المنشأة :",font,3));
        table0.addCell( saisir_cellule_tmp(" : Description d'installation",font,3));
        table0.addCell( MyCell("رقم الطلب :",font,3));
        table0.addCell( saisir_cellule_tmp(" : N° de la demande",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDescription(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),6));
        table0.completeRow();
        table0.addCell( MyCell("هيكل المنشأة :",font,2));
        table0.addCell( saisir_cellule_tmp(" : structure d'installation",font,3));
        table0.addCell( MyCell("نوع الجهاز :",font,2));
        table0.addCell( saisir_cellule_tmp(" : Type d'appareil",font,3));
        table0.addCell( MyCell("الموقع  :",font,1));
        table0.addCell( saisir_cellule_tmp(" : Site",font,1));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getStructure(),5));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getType_appareil(),5));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getSite(),2));
        table0.completeRow();
        table0.addCell( MyCell("الوحدة :",font,2));
        table0.addCell( saisir_cellule_tmp(" : Unité",font,2));
        table0.addCell( MyCell("الكمية :",font,2));
        table0.addCell( saisir_cellule_tmp(": Quantité",font,2));
        table0.addCell( MyCell("العملية :",font,2));
        table0.addCell( saisir_cellule_tmp(":Operation",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation(),4));
        table0.completeRow();


        table0.completeRow();
        //--------------------- Row Title ---------------------

        if(ns.getType().equals("3")){
            table0.addCell(saisir_cellule_transporteur_titre("Code",6));
            table0.addCell(saisir_cellule_transporteur_titre("Type",6));
            table0.completeRow();
            table0.setSpacingAfter(5);
            table0.addCell(MonCellule("vous avez selectionnez toutes la liste", 12));
            table0.completeRow();
        }
        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table1.addCell(saisir_cellule_titre1("معلومات عن صاحب المشروع",6));
        table1.addCell(saisir_cellule_titre("Information sur pétitionnaire",6));
        table1.completeRow();
        //--------------------- completeRow ---------------------

        table1.addCell( MyCell("اسم الشركة : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Nom de la société",font,2));
        table1.addCell( MyCell("البريد الإلكتروني : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Identifiant",font,2));
        table1.addCell( MyCell("الهاتف : ",font,2));
        table1.addCell( saisir_cellule_tmp(" : Télephone",font,2));
        table1.completeRow();
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison()!=null?ns.getRaison():"-",4));
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEmail()!=null?ns.getEmail():"-",4));
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTel()!=null?ns.getTel():"-",4));
        table1.completeRow();
        table1.addCell( MyCell("الفاكس : ",font,3));
        table1.addCell( saisir_cellule_tmp(" : Fax",font,3));
        table1.addCell( MyCell("العنوان : ",font,3));
        table1.addCell( saisir_cellule_tmp(" : Adresse",font,3));
        table1.completeRow();
        table1.addCell( saisir_cellule_tmp2(fontbold,ns.getFax()!=null?ns.getFax():"-",6));
        table1.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse()!=null?ns.getAdresse():"-",6));
        table1.completeRow();


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(12);
        table2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre1("فريق العمل",6));
        table2.addCell(saisir_cellule_titre("Equipe De Travail",6));
        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( MyCell("عدد الفريق : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Nombre d'equipe",font,2));
        table2.addCell( MyCell("عدد الموظفين : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Nombre d'effectif",font,2));
        table2.addCell( MyCell("ساعات العمل : ",font,2));
        table2.addCell( saisir_cellule_tmp(" : Horaire Début d'exploitation",font,2));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getNbr_equipe_travail(),4));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getFormation(),4));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getHoraire_exploitation(),4));
        table2.setSpacingAfter(12);

        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_instalation/"
                + ns.getId_installation(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);
        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب ",6));
        table7.addCell(saisir_cellule_titre("Pièces accompagnant la demande",6));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }



        document.add(headerPar);
        document.add(table0);
        document.add(table1);
        document.add(table2);
        if(ns.getType().equals("1") || ns.getType().equals("2")){
            PdfPTable table_x = new PdfPTable(4);
            table_x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
            table_x.setWidthPercentage(100);
            table_x.setSpacingBefore(12);
            table_x.setSpacingAfter(12);
            table_x.addCell(saisir_cellule_titre1("المصنف المغربي النفايات",2));
            table_x.addCell(saisir_cellule_titre("Catalogue Marocain des déchets",2));
            table_x.completeRow();
            if(ns.getType().equals("1")) {
                table_x.addCell(MonCellule("Vous avez selectionnez tous les codes à l'exception de la liste ci-dessous", 4));
                table_x.completeRow();
            }

            table_x.addCell(saisir_cellule_transporteur_titre("Code",2));
            table_x.addCell(saisir_cellule_transporteur_titre("Type",2));
            table_x.completeRow();
            if(ns.getCode().size()>14){
                table_x.setSpacingAfter(600);
            }
            else{
                table_x.setSpacingAfter(12);
            }
            //--------------------- completeRow ---------------------
            for (Code c:ns.getCode()){
                table_x.addCell(saisir_cellule("",font,font,c.getNom_fr()!=null?RTL_LTR(c.getNom_fr()):"-",2));
                table_x.addCell(saisir_cellule("",font,font,c.getNom_ar()!=null?c.getNom_ar():"-",2));
                table_x.completeRow();
            }
            document.add(table_x);
            if(ns.getCode().size()>14){
                addFooter(writer,codeQrImage);
            }


        }
        document.add(table7);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateRecapCollecte(CollecteTransporteur ns,ListDocNotif[] l, DocImport[] d,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);
        Font BlackText = new Font(base,10,Font.NORMAL,BaseColor.BLACK);


        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Récapitulation de la demande d'autorisation Collecte Transport Des déchets dangereux");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Collecte  ---------------------

        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("معلومات عن الطالب",6));
        table0.addCell(saisir_cellule_titre("Information sur demandeur",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الطلب",font,3));
        table0.addCell( saisir_cellule_tmp("N° de la demande",font,3));
        table0.addCell( MyCell("اسم الشركة ",font,3));
        table0.addCell( saisir_cellule_tmp("Nom de la société",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison(),6));
        table0.completeRow();
        table0.addCell( MyCell("الممثل القانوني",font,2));
        table0.addCell( saisir_cellule_tmp("Represantant ",font,2));
        table0.addCell( MyCell("الهاتف ",font,2));
        table0.addCell( saisir_cellule_tmp("Télephone",font,2));
        table0.addCell( MyCell("الفاكس ",font,2));
        table0.addCell( saisir_cellule_tmp("Fax ",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeur_Nom(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurTel(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurFax(),4));
        table0.completeRow();
        table0.addCell( MyCell("البريد الإلكتروني ",font,3));
        table0.addCell( saisir_cellule_tmp("Email",font,3));
        table0.addCell( MyCell("العنوان",font,3));
        table0.addCell( saisir_cellule_tmp("Adresse ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurEmail(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getDemandeurAdresse(),6));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(4);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table01.addCell(saisir_cellule_titre1("قائمة النفايات المختارة",2));
        table01.addCell(saisir_cellule_titre("List des déchets choisi",2));
        table01.completeRow();
        table01.addCell(saisir_cellule("",fontBox,font,"",4));

        //--------------------- completeRow ---------------------
        table01.addCell( MyCell("الرمز",font,1));
        table01.addCell( saisir_cellule_tmp("Code",font,1));
        table01.addCell( MyCell("نوع",font,1));
        table01.addCell( saisir_cellule_tmp("Type",font,1));
        table01.completeRow();
        for (Code c:ns.getCode()){
            table01.addCell(saisir_cellule_tmp3(c.getNom_fr()!=null?RTL_LTR(c.getNom_fr()):"-",font,2));
            table01.addCell(saisir_cellule_tmp3(c.getNom_ar()!=null?c.getNom_ar():"-",font,2));
            table01.completeRow();
        }


        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3 = new PdfPTable(12);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table3.addCell(saisir_cellule_titre1(" بيانات المركبة ",6));
        table3.addCell(saisir_cellule_titre(" Données sur les véhicules ",6));
        table3.completeRow();
        //--------------------- completeRow ---------------------
        table3.addCell( MyCell("عدد الحاويات : ",font,3));
        table3.addCell( saisir_cellule_tmp(ns.getNombre_conteneur()+" : Nombre de conteneurs",font,3));
        table3.addCell( MyCell("عدد المركبات : ",font,3));
        table3.addCell( saisir_cellule_tmp(ns.getNombre_vehicule()+" : Nombre de Véhicule",font,3));
        table3.completeRow();
        table3.addCell(saisir_cellule_transporteur_titre("N° d'immatriculation\t",2));
        table3.addCell(saisir_cellule_transporteur_titre("N° Châssis\t ",2));
        table3.addCell(saisir_cellule_transporteur_titre("Poids total en charge\t",2));
        table3.addCell(saisir_cellule_transporteur_titre("Poids net du véhicule\t",2));
        table3.addCell( saisir_cellule_transporteur_titre("Type de véhicules\t",2));
        table3.addCell( saisir_cellule_transporteur_titre("type de conteneurs\t",2));
        table3.completeRow();
        if(ns.getVehicules()!=null && ns.getVehicules().size()>0){
            for (Vehicules tp:ns.getVehicules()) {
                table3.addCell( saisir_cellule(tp.getNum_mat_enrg_voit()+"-"+tp.getNum_mat_enrg_auto()+"-"+tp.getNum_mat_id_prefect(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getNum_chassis(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getPoit_totale_charge(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getPoint_net(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getTypeVehicule(),font,font,"",2));
                table3.addCell( saisir_cellule(tp.getTypeConteneur(),font,font,"",2));
                table3.completeRow();
            }
        }else{
            PdfPCell tmp =  saisir_cellule("Aucun Transporteur.",fontbold,fontbold,"",4);
            tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
            table3.addCell(tmp);
        }
        table3.completeRow();
        table3.setSpacingAfter(12);


        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب ",6));
        table7.addCell(saisir_cellule_titre("Pièces accompagnant la demande",6));
        table7.completeRow();
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }

        PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);
        cell2.setColspan(1);
        cell2.addElement(new Phrase(""));
        table7.addCell(cell2);
        table7.completeRow();

        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_collecte/"
                + ns.getId_collecte(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);




        document.add(headerPar);
        document.add(table0);
        document.add(table3);
        document.add(table7);
        document.add(table01);
        addFooter(writer,codeQrImage);

        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateRecapEie(DemandeInformation ns,ListDocNotif[] l,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,14.0f);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);

        PdfPTable table00 = new PdfPTable(12);
        table00.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table00.setWidthPercentage(100);
        table00.setSpacingBefore(12);
        table00.setSpacingAfter(12);
        if(ns.getType().equals("EE")) {
            table00.addCell(saisir_cellule_tmp4("Récapitulation de la demande Etude d’Impact sur l’Environnement",fontTitre,12));
        }
        if(ns.getType().equals("AE")) {
            table00.addCell(saisir_cellule_tmp4("Récapitulation de la demande du Certificat de Conformité Environnementale",fontTitre,12));
            table00.addCell(saisir_cellule_tmp4(" ملخص عن طلب قرار المطابقة البيئية",fontTitre,12));
        }
        if(ns.getType().equals("NT")) {
            table00.addCell(saisir_cellule_tmp4("Récapitulation de la demande Notice d’Impact sur l’Environnement",fontTitre,12));
        }
        if(ns.getType().equals("RS")) {
            table00.addCell(saisir_cellule_tmp4("Récapitulation de la demande de Renseignements préalables",fontTitre,12));
        }
        //--------------------- Table numero de Collecte  ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        if(ns.getType().equals("AE")){
            table0.addCell(saisir_cellule_titre1("معلومات عن صاحب النشاط أو الوحدة الصناعية ",6));
            table0.addCell(saisir_cellule_titre("informations sur l'exploitant ",6));
        }else{
            table0.addCell(saisir_cellule_titre1("معلومات عن صاحب المشروع ",6));
            table0.addCell(saisir_cellule_titre("informations sur le pétitionnaire ",6));
        }

        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الطلب",font,2));
        table0.addCell( saisir_cellule_tmp("N° de la demande",font,2));
        table0.addCell( MyCell("اسم الشركة ",font,2));
        table0.addCell( saisir_cellule_tmp("Nom de la société",font,2));
        table0.addCell( MyCell("الممثل القانوني",font,2));
        table0.addCell( saisir_cellule_tmp("Représentant légal",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_demande(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getRaison_social(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getRepresantant(),4));
        table0.completeRow();
        table0.addCell( MyCell("الهاتف ",font,3));
        table0.addCell( saisir_cellule_tmp("Téléphone",font,3));
        table0.addCell( MyCell("الفاكس ",font,3));
        table0.addCell( saisir_cellule_tmp("Fax ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getTel(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getFax(),6));
        table0.completeRow();
        table0.addCell( MyCell("البريد الإلكتروني ",font,3));
        table0.addCell( saisir_cellule_tmp("Email",font,3));
        table0.addCell( MyCell("العنوان",font,3));
        table0.addCell( saisir_cellule_tmp("Adresse ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getEmail(),6));
        table0.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse(),6));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getType().equals("AE")){
            table01.addCell(saisir_cellule_titre1("معلومات النشاط أو الوحدة الصناعية ",6));
            table01.addCell(saisir_cellule_titre("informations sur l'activité/de l’unité industrielle ",6));
        }else{
            table01.addCell(saisir_cellule_titre1("معلومات المشروع ",6));
            table01.addCell(saisir_cellule_titre("informations sur le projet ",6));
        }

        table01.completeRow();
        //--------------------- completeRow ---------------------
        if(ns.getType().equals("AE")){
            table01.addCell(MyCell("عنوان النشاط أو الوحدة الصناعية",font,2));
            table01.addCell(saisir_cellule_tmp("Intitulé de l'activité",font,2));
        }else{
            table01.addCell(MyCell("عنوان المشروع",font,2));
            table01.addCell(saisir_cellule_tmp("Intitulé du projet",font,2));
        }

        table01.addCell(MyCell("مبلغ الاستثمار بملايين الدراهم",font,2));
        table01.addCell(saisir_cellule_tmp("Montant d'investissement en MDH",font,2));
        if(ns.getType().equals("EE")){
            table01.addCell(MyCell("عابر للحدود",font,2));
            table01.addCell(saisir_cellule_tmp("Transfrontalier",font,2));
        }
        else if(ns.getType().equals("AE")){
            table01.addCell(MyCell("نوع النشاط أو الوحدة الصناعية",font,2));
            table01.addCell(saisir_cellule_tmp("Nature de l’activité/de l’unité industrielle",font,2));
        }
        else{
            table01.addCell(MyCell("طبيعة المشروع ",font,2));
            table01.addCell(saisir_cellule_tmp("Nature de projet",font,2));
        }
        table01.completeRow();
        table01.addCell(saisir_cellule_tmp2(fontbold,ns.getIntitule_projet(),4));
        table01.addCell(saisir_cellule_tmp2(fontbold,String.valueOf(ns.getMontant_investissement()),4));
        if(ns.getType().equals("EE")){
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getTronsfrontalier(),4));
        }
        else if(ns.getType().equals("AE")){
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getNature_projet(),4));
        }
        else{
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getNature_projet(),4));
        }
        table01.completeRow();
        /*if(ns.getType().equals("AE")){

        	DateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
        	Date date;
        	Date date2;
        	try {
        	    date = dateFormate.parse(ns.getDateDemarage());
        	    date2 = dateFormate.parse(ns.getDateResiliation());

                String dateDemarage=convertDate("dd/MM/yyyy",date);
                String dateResiliation=convertDate("dd/MM/yyyy",date2);

                table01.addCell(saisir_cellule("Date Démarage : ",font,fontbold,dateDemarage,1));
                table01.addCell(saisir_cellule("Date Résiliation : ",font,fontbold,dateResiliation,2));
                table01.completeRow();

        	}

        	catch (ParseException e) {
        	    e.printStackTrace();
        	}


        }*/
        if(ns.getType().equals("NT")){
            table01.addCell(saisir_cellule("Nature du projet :",font,fontbold,ns.getNature_projet(),12));
            table01.completeRow();
        }

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3 = new PdfPTable(12);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getType().equals("AE")){
            table3.addCell(saisir_cellule_titre1("موقع النشاط أو الوحدة الصناعية",6));
            table3.addCell(saisir_cellule_titre("Localisation de l’activité/de l’unité industrielle  ",6));
        }else{
            table3.addCell(saisir_cellule_titre1("موقع المشروع",6));
            table3.addCell(saisir_cellule_titre("Localisation du projet  ",6));
        }

        table3.completeRow();
        //--------------------- completeRow ---------------------
        table3.addCell(MyCell("الجهات",font,2));
        table3.addCell(saisir_cellule_tmp("Régions",font,2));
        table3.addCell(MyCell("العمالات / الأقاليم",font,2));
        table3.addCell(saisir_cellule_tmp("Préfecture(s) et province(s)",font,2));
        table3.addCell(MyCell("الجماعات",font,2));
        table3.addCell(saisir_cellule_tmp("Communes",font,2));
        table3.completeRow();
        PdfPCell cell8 = new PdfPCell();
        PdfPCell cell9 = new PdfPCell();
        PdfPCell cell10 = new PdfPCell();
        Paragraph p5 = new Paragraph();
        Paragraph p6 = new Paragraph();
        Paragraph p7 = new Paragraph();
        if(ns.getDetailRegion()!=null) {
            for (Region r : ns.getDetailRegion().getRegion()) {
                p5.setAlignment(Element.ALIGN_RIGHT);
                cell8.setPadding(5);
                cell8.setColspan(4);
                p5.add(new Phrase(r.getNom_fr()+" \n \n" ,font));
                // table3.addCell(saisir_cellule(r.getNom_fr(), font, font, "", 2));
            }
            cell8.addElement(p5);
            table3.addCell(cell8);
            for (Prefecture p : ns.getDetailRegion().getPrefectures()) {
                p6.setAlignment(Element.ALIGN_RIGHT);
                cell9.setPadding(5);
                cell9.setColspan(4);
                p6.add(new Phrase(p.getNom_fr()+" \n \n" ,font));
                //table3.addCell(saisir_cellule(p.getNom_fr(), font, font, "", 1));
            }
            cell9.addElement(p6);
            table3.addCell(cell9);
            for (Commune c : ns.getDetailRegion().getCommunes()) {
                p7.setAlignment(Element.ALIGN_RIGHT);
                cell10.setPadding(5);
                cell10.setColspan(4);
                p7.add(new Phrase(c.getNom_fr()+" \n \n" ,font));
                //table3.addCell(saisir_cellule(c.getNom_fr(), font, font, "", 1));
            }
            cell10.addElement(p7);
            table3.addCell(cell10);
            table3.completeRow();
        }

        table3.setSpacingAfter(12);

        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        //--------------------- Tableau Les Pièces ---------------------
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب ",6));
        table7.addCell(saisir_cellule_titre("Pièces accompagnant la demande",6));
        table7.completeRow();
        if(!ns.getType().equals("RS")){
            //--------------------- Row Title ---------------------
            int i=1;
            for (ListDocNotif ld: l){
                table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
                i++;
                table7.completeRow();
            }
        }else{
            table7.addCell(saisir_cellule_transporteur_titre("Aucun Document ",3));
        }


        String num_notification = ns.getNum_demande()!=null?ns.getNum_demande():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_Eie/"
                + ns.getId_demande_information(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        document.add(table00);
        document.add(table0);
        document.add(table01);
        document.add(table3);
        document.add(table7);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }
    public static ByteArrayInputStream generateRecapInscription(Compte c,String url,String password) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont basefont = null;
        try {
            basefont = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 10.0f);
        Font fontBox2 = new Font(basefont, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox2);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox2);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        headerPar.add("Récapitulation de l'inscription");
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de Collecte  ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("معلومات عن صاحب الطلب ",6));
        table0.addCell(saisir_cellule_titre("Informations sur le demandeur ",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------

        table0.addCell( MyCell("اسم الشركة ",font,2));
        table0.addCell( saisir_cellule_tmp("Nom de la société",font,2));
        table0.addCell( MyCell("الممثل القانوني",font,2));
        table0.addCell( saisir_cellule_tmp("Represantant ",font,2));
        table0.addCell( MyCell("رقم RC ",font,2));
        table0.addCell( saisir_cellule_tmp("Numéro RC ",font,2));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,c.getSt().getRaison_fr(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,c.getSt().getName_fr(),4));
        table0.addCell( saisir_cellule_tmp2(fontbold,c.getSt().getNumRc(),4));
        table0.completeRow();
        table0.addCell( MyCell("الهاتف ",font,3));
        table0.addCell( saisir_cellule_tmp("Télephone",font,3));
        table0.addCell( MyCell("العنوان",font,3));
        table0.addCell( saisir_cellule_tmp("Adresse ",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,c.getSt().getTel(),6));
        table0.addCell( saisir_cellule_adresse(fontbold,c.getSt().getAdresse_ar(),6));
        table0.completeRow();

        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table01.setWidthPercentage(100);
        table01.setSpacingBefore(12);
        table01.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table01.addCell(saisir_cellule_titre1("معلومات تسجيل الدخول",6));
        table01.addCell(saisir_cellule_titre("Informations sur l'authentification",6));
        table01.completeRow();
        //--------------------- completeRow ---------------------
        table01.addCell( MyCell("كلمة السر ",font,3));
        table01.addCell( saisir_cellule_tmp("Mot de passe",font,3));
        table01.addCell( MyCell("رمز التعريف ",font,3));
        table01.addCell( saisir_cellule_tmp("Identifiant",font,3));
        table01.completeRow();
        table01.addCell( saisir_cellule_tmp2(fontbold,RTL_LTR(password),6));
        table01.addCell( saisir_cellule_tmp2(fontbold,c.getEmail(),6));
        table01.completeRow();
        table01.addCell( MyCell("البريد الإلكتروني ",font,6));
        table01.addCell( saisir_cellule_tmp("Email",font,6));
        table01.completeRow();
        table01.addCell( saisir_cellule_tmp2(fontbold,c.getSt().getEmail(),12));
        table01.completeRow();

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table3x = new PdfPTable(12);
        table3x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3x.setWidthPercentage(100);

        //--------------------- Row Title ---------------------
        table3x.addCell(saisir_cellule_titre1("الوثائق الإدارية",6));
        table3x.addCell(saisir_cellule_titre("Choix des actes administratifs ",6));
        table3x.completeRow();

        //--------------------- completeRow ---------------------
        table3x.addCell( MyCell("التقييم البيئي",font,3));
        table3x.addCell( saisir_cellule_tmp("Evaluation environnementale ",font,3));
        table3x.addCell( MyCell("ترخيص النفايات ",font,3));
        table3x.addCell( saisir_cellule_tmp("Autorisation des déchets",font,3));
        table3x.completeRow();

        PdfPTable table3 = new PdfPTable(8);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        table3.setWidthPercentage(100);
        table3.setSpacingAfter(12);

        Chunk zf = uncheckedChunk;
        Chunk et = uncheckedChunk;
        Chunk tr = uncheckedChunk;
        Chunk xd = uncheckedChunk;
        Chunk ct = uncheckedChunk;
        Chunk it = uncheckedChunk;
        Chunk ee = uncheckedChunk;
        Chunk nt = uncheckedChunk;
        Chunk ae = uncheckedChunk;

        if(c.getSt().getZF()!=null) {
            zf = c.getSt().getZF().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getET()!=null) {

            et = c.getSt().getET().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getXD()!=null) {

            xd = c.getSt().getXD().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getTR()!=null) {

            tr = c.getSt().getTR().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getIT()!=null) {

            it = c.getSt().getIT().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getCT()!=null) {

            ct = c.getSt().getCT().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getEIE()!=null) {

            ee = c.getSt().getEIE().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getNT()!=null) {

            nt = c.getSt().getNT().equals("on") ? checkedChunk : uncheckedChunk;
        }
        if(c.getSt().getEA()!=null) {

            ae = c.getSt().getEA().equals("on") ? checkedChunk : uncheckedChunk;
        }

        PdfPCell cell = new PdfPCell();
        Paragraph p = new Paragraph();
        PdfPCell cell2 = new PdfPCell();
        Paragraph p2 = new Paragraph();
        PdfPCell cell3 = new PdfPCell();
        Paragraph p3 = new Paragraph();
        PdfPCell cell4 = new PdfPCell();
        Paragraph p4 = new Paragraph();
        cell.setColspan(3);
        cell2.setColspan(1);
        cell3.setColspan(3);
        cell4.setColspan(1);
        cell.setPaddingLeft(2);
        cell2.setPaddingLeft(5);
        cell3.setPaddingLeft(5);
        cell4.setPaddingLeft(5);
        cell.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        cell3.setBorder(Rectangle.NO_BORDER);
        cell4.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.TOP);
        cell2.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
        cell3.setBorder(Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.TOP);
        cell4.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);


        p.add(new Phrase("Importation des déchets d'une zone franche",fontBox));
        p2.add(new Phrase(zf));
        p.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p.add(new Phrase("Importation des déchets non dangereux d'un pays étranger",fontBox));
        p2.add(new Phrase(et));
        p.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p.add(new Phrase("Transit des déchets",fontBox));
        p2.add(new Phrase(tr));
        p.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p.add(new Phrase("Exportation des déchets ",fontBox));
        p2.add(new Phrase(xd));
        p.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p.add(new Phrase("Collecte - transport des déchets dangereux",fontBox));
        p2.add(new Phrase(ct));
        p.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p.add(new Phrase("Installation de traitement des déchets dangereux",fontBox));
        p2.add(new Phrase(it));
        p.add(Chunk.NEWLINE);
        p2.add(Chunk.NEWLINE);
        p3.add(new Phrase("Etude d’Impact sur l’Environnement",fontBox));
        p4.add(new Phrase(ee));
        p3.add(Chunk.NEWLINE);
        p4.add(Chunk.NEWLINE);
        p3.add(new Phrase("Notice d’Impact sur l’Environnement",fontBox));
        p4.add(new Phrase(nt));
        p3.add(Chunk.NEWLINE);
        p4.add(Chunk.NEWLINE);
        p3.add(new Phrase("Audit Environnemental",fontBox));
        p4.add(new Phrase(ae));
        p3.add(Chunk.NEWLINE);
        p4.add(Chunk.NEWLINE);
        p.setAlignment(Element.ALIGN_LEFT);
        p2.setAlignment(Element.ALIGN_LEFT);
        p3.setAlignment(Element.ALIGN_LEFT);
        p4.setAlignment(Element.ALIGN_LEFT);
        cell.addElement(p);
        cell2.addElement(p2);
        cell3.addElement(p3);
        cell4.addElement(p4);
        table3.addCell(cell);
        table3.addCell(cell2);
        table3.addCell(cell3);
        table3.addCell(cell4);
        table3.completeRow();

        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generateRecapInscription/"
                + c.getCompteId(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table3x);
        document.add(table3);


        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }


    public static PdfPCell saisir_cellule(String label,Font font_label,Font font_var,String var, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Phrase ph2 = new Phrase(var,font_var);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_RIGHT);
        ppp.add(ph1);
        ppp.add(ph2);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        return cell1;
    }
    public static PdfPCell saisir_cellule_tmp(String label,Font font_label, int collspan){
        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Phrase ph1 = new Phrase(label,font_label);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_RIGHT);
        ppp.add(ph1);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(solid, null, null, dashed));
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        return cell1;
    }
    public static PdfPCell saisir_cellule_tmp2(Font font_var,String var, int collspan){

        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Phrase ph1 = new Phrase(var,font_var);
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_CENTER);
        p1.add(ph1);
        PdfPCell cell1 = new PdfPCell(p1);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(solid, solid, null, solid));
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell1;
    }

    public static PdfPCell saisir_cellule_tmp3(String label,Font font_label, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_RIGHT);
        ppp.add(ph1);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        return cell1;
    }

    public static PdfPCell saisir_cellule_tmp4(String label,Font font_label, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Paragraph ppp = new Paragraph();
        ppp.setAlignment(Element.ALIGN_CENTER);
        ppp.add(ph1);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setBorderWidthLeft(0f);
        cell1.setBorderWidthRight(0f);
        cell1.setBorderWidthTop(0f);
        cell1.setBorderWidthBottom(0f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell1;
    }

    public static PdfPCell saisir_cellule2(String label,Font font_label,Font font_var,String var, int collspan){

        Phrase ph1 = new Phrase(label,font_label);
        Phrase ph2 = new Phrase(var,font_var);
        Paragraph ppp = new Paragraph();
        ppp.add(ph1);
        ppp.add(ph2);
        PdfPCell cell1 = new PdfPCell(ppp);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        return cell1;
    }

    public static PdfPCell saisir_cellule_titre(String label,int collspan){
        Font whiteText = new Font(Font.FontFamily.TIMES_ROMAN,12.0f,Font.BOLD,BaseColor.WHITE);
        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();
        Paragraph para = new Paragraph(label,whiteText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setBorder(Rectangle.NO_BORDER);
        cell0.setCellEvent(new CustomBorder(solid, null, solid, solid));
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell0.setPaddingBottom(10f);
        cell0.setPaddingTop(3f);
        cell0.setBackgroundColor(new BaseColor(51, 108, 78));
        return cell0;
    }


    public static PdfPCell saisir_cellule_titre1(String label,int collspan) throws DocumentException, IOException {
        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Font font=new Font(base,12.0f,Font.BOLD,BaseColor.WHITE);
        Paragraph para = new Paragraph(label,font);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setBorder(Rectangle.NO_BORDER);
        cell0.setCellEvent(new CustomBorder(null, solid, solid, solid));
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell0.setPaddingBottom(10f);
        cell0.setPaddingTop(3f);
        cell0.setBackgroundColor(new BaseColor(51, 108, 78));
        return cell0;
    }

    public static PdfPCell saisir_cellule_transporteur_titre(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(new BaseColor(222, 226, 230));
        return cell0;
    }

    public static PdfPCell saisir_cellule_producteur_titre(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(new BaseColor(222, 226, 230));
        return cell0;
    }

    public static PdfPCell MonCellule(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.BOLD,BaseColor.WHITE);
        Paragraph para = new Paragraph(label,BlackText);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell0.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        cell0.setBackgroundColor(BaseColor.ORANGE);
        return cell0;
    }

    public static PdfPCell saisir_cellule_2(String label,int collspan){
        Font BlackText = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.NORMAL,BaseColor.BLACK);
        Paragraph para = new Paragraph(label,BlackText);
        para.setAlignment(Element.ALIGN_RIGHT);
        PdfPCell cell0 = new PdfPCell(para);
        cell0.setColspan(collspan);
        cell0.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell0.setPaddingBottom(5f);
        cell0.setPaddingTop(2.5f);
        return cell0;
    }
    public static String convertDate(String type, Date date) {
        String strDate = "";
        if (date == null) {

        } else {

            SimpleDateFormat formatter = new SimpleDateFormat(type);
            strDate = formatter.format(date);

        }
        return strDate;
    }



    public static PdfPCell MyCell(String label,Font font_label,int collspan){

        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();
        Phrase ph1 = new Phrase(label,font_label);
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_LEFT);
        p1.add(ph1);
        PdfPCell cell1 = new PdfPCell(p1);
        cell1.setPaddingBottom(5f);
        cell1.setPaddingTop(2.5f);
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(null, solid, null, dashed));
        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
        return cell1;
    }


    public static ByteArrayInputStream generateRecapNotification(Notification ns,ListDocNotif[] l,DocImport[] d,DeclarationTransporteur dt,String url) throws DocumentException, IOException, ParseException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font font_sm=new Font(base,8.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        String title_type = "...";
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1){
            title_type = "d'importation des déchets dangereux d'une zone franche";
        }else if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==2){
            title_type = "d'importation des déchets  non dangereux d'une zone franche";
        }else if(ns.getZf_et().equals("ET")){
            title_type = "d'importation des déchets non dangereux d'un pays étranger";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==1){
            title_type = "d'exportation des déchets dangereux";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==2){
            title_type = "d'exportation des déchets non dangereux";
        }else if(ns.getZf_et().equals("TR")){
            title_type = "Transit des déchets";
        }
        headerPar.add("Récapitulation de la demande d'autorisation "+title_type);
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de notification ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("رقم الإخطار",6));
        table0.addCell(saisir_cellule_titre("Numéro de notification",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الإخطار",font,3));
        table0.addCell( saisir_cellule_tmp("Numéro de notification",font,3));
        table0.addCell( MyCell("تصنيف النفايات ",font,3));
        table0.addCell( saisir_cellule_tmp("Classification des déchets",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_notification(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getClassification()!=null?ns.getClassification().getNom_fr():"-",6));
        table0.completeRow();
        table0.addCell( MyCell("الرمز ",font,3));
        table0.addCell( saisir_cellule_tmp("Code",font,3));
        table0.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table0.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?RTL_LTR(ns.getCode().getNom_fr()):"-",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table0.completeRow();
        table0.addCell( MyCell("العملية",font,3));
        table0.addCell( saisir_cellule_tmp("Opération",font,3));
        table0.addCell( MyCell("وحدة",font,3));
        table0.addCell( saisir_cellule_tmp("Unité",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",6));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(MyCell("المنطقة الحرة", font, 3));
            table0.addCell(saisir_cellule_tmp("Zone Franche", font, 3));
        }else if(ns.getZf_et().equals("ET")) {
            table0.addCell(MyCell("بلد أجنبي", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays étranger", font, 3));
        }
        else {
            table0.addCell(MyCell("بلد التصدير ", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays d'exportation", font, 3));
        }
        table0.addCell( MyCell("نوع النفايات",font,3));
        table0.addCell( saisir_cellule_tmp("Type de déchet",font,3));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getZonneFranche() != null ? ns.getZonneFranche().getNom_fr() : "-", 6));
        }else {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getPays() != null ? ns.getPays().getNom_fr() : "-", 6));
        }
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?ns.getCode().getNom_ar():"-",6));

        //---------------------Tableau Exportateur - Notifiant ----------------------


        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        if (ns.getZf_et().equals("XD") || ns.getZf_et().equals("TR") || ns.getZf_et().equals("ET")){
            table01.setWidthPercentage(100);
            table01.setSpacingBefore(12);
            table01.setSpacingAfter(12);

            //--------------------- Row Title ---------------------
            table01.addCell(saisir_cellule_titre1("المصدر - المخطر ",6));
            table01.addCell(saisir_cellule_titre("Exportateur - Notifiant",6));
            table01.completeRow();
            //--------------------- completeRow ---------------------
            if(ns.getZf_et().equals("TR")) {
                table01.addCell(MyCell("اسم المصدر المخطر", font, 3));
                table01.addCell(saisir_cellule_tmp("Nom de l'exportateur Notifiant", font, 3));
                table01.addCell(MyCell("البريد الالكتروني", font, 3));
                table01.addCell(saisir_cellule_tmp("Courrier électronique", font, 3));

                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getNom(), 6));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getCourrier(),6));
                table01.completeRow();
                table01.addCell(MyCell("الهاتف", font, 3));
                table01.addCell(saisir_cellule_tmp("Télephone", font, 3));
                table01.addCell(MyCell("فاكس", font, 3));
                table01.addCell(saisir_cellule_tmp("Télécopie", font, 3));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTel(), 6));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTelecopie(), 6));
                table01.completeRow();

                table01.addCell( MyCell("جهة الاتصال",font,3));
                table01.addCell( saisir_cellule_tmp("Personne à contacter",font,3));
                table01.addCell( MyCell("العنوان",font,3));
                table01.addCell( saisir_cellule_tmp("Adresse",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getPersonne(),6));
                table01.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse(),6));
                table01.completeRow();

                table01.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,3));
                table01.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,3));
                table01.addCell( MyCell("الرمز الوطني في البلد المُستورد",font,3));
                table01.addCell( saisir_cellule_tmp("Code National dans le pays d'importation",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",6));
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalIm()!=null?ns.getCodeNationalIm():"-",6));
                table01.completeRow();

                table01.addCell( MyCell("قائمة النفايات CE",font,3));
                table01.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,3));
                table01.addCell( MyCell("بلد الاستيراد / الوجهة",font,3));
                table01.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",6));
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",6));
                table01.completeRow();
            }
            else{
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(MyCell("اسم المصدر المخطر", font, 2));
                    table01.addCell(saisir_cellule_tmp("Nom de l'exportateur notifiant", font, 2));
                }
                else {
                    table01.addCell(MyCell("إسم الشركة", font, 2));
                    table01.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
                }
                table01.addCell(MyCell("البريد الالكتروني", font, 2));
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(saisir_cellule_tmp("Courrier électonique", font, 2));
                }else {
                    table01.addCell(saisir_cellule_tmp("Email", font, 2));
                }
                table01.addCell(MyCell("الهاتف", font, 2));
                table01.addCell(saisir_cellule_tmp("Télephone", font, 2));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getNom(), 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getCourrier(), 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTel(), 4));
                table01.completeRow();
                table01.addCell(MyCell("فاكس", font, 2));
                if(ns.getZf_et().equals("ET")){
                    table01.addCell(saisir_cellule_tmp("Télécopie", font, 2));
                }else{
                    table01.addCell(saisir_cellule_tmp("Fax", font, 2));
                }

                table01.addCell(MyCell("الجهة", font, 2));
                table01.addCell(saisir_cellule_tmp("Région", font, 2));
                table01.addCell(MyCell("المحافظة", font, 2));
                table01.addCell(saisir_cellule_tmp("Préfecture", font, 2));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTelecopie(), 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getRegion() != null ? ns.getRegion().getNom_fr() : "-", 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getPrefecture() != null ? ns.getPrefecture().getNom_fr() : "-", 4));
                table01.completeRow();
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(MyCell("جهة الاتصال", font, 3));
                    table01.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));

                    table01.addCell(MyCell("العنوان", font, 3));
                    table01.addCell(saisir_cellule_tmp("Adresse", font, 3));
                    table01.completeRow();
                    table01.addCell(saisir_cellule_tmp2(fontbold, ns.getPersonne(), 6));
                    table01.addCell(saisir_cellule_adresse(fontbold, ns.getAdresse(), 6));
                    table01.completeRow();

                    table01.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,2));
                    table01.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,2));
                    table01.addCell( MyCell("قائمة النفايات CE",font,2));
                    table01.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,2));
                    table01.addCell( MyCell("بلد الاستيراد / الوجهة",font,2));
                    table01.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,2));
                    table01.completeRow();
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"-",4));
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",4));
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",4));
                    table01.completeRow();
                }
                else{
                    table01.addCell(MyCell("جهة الاتصال", font, 3));
                    table01.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
                    table01.addCell(MyCell("العنوان", font, 3));
                    table01.addCell(saisir_cellule_tmp("Adresse", font, 3));
                    table01.completeRow();
                    table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                    table01.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 6));
                    table01.completeRow();
                }
            }

        }

        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);
        if (ns.getZf_et().equals("XD")) {

            //--------------------- Row Title ---------------------
            table1.addCell(saisir_cellule_titre1("المستورد - المتلقي",6));
            table1.addCell(saisir_cellule_titre("Importateur - Destinataire",6));
            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell( MyCell("اسم المستورد المتلقي",font,2));
            table1.addCell( saisir_cellule_tmp("Nom de l'importateur destinataire",font,2));
            table1.addCell( MyCell("الفاكس",font,2));
            table1.addCell( saisir_cellule_tmp("Télécopie",font,2));
            table1.addCell( MyCell("جهة الاتصال",font,2));
            table1.addCell( saisir_cellule_tmp("Personne à contacter",font,2));
            table1.completeRow();
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getNom()!=null?ns.getNom():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTelecopie()!=null?ns.getTelecopie():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getPersonne()!=null?ns.getPersonne():"",4));
            table1.completeRow();
            table1.addCell( MyCell("الهاتف",font,2));
            table1.addCell( saisir_cellule_tmp("Téléphone",font,2));
            table1.addCell( MyCell("البريد الالكتروني",font,2));
            table1.addCell( saisir_cellule_tmp("courrier électronique",font,2));
            table1.addCell( MyCell("عنوان",font,2));
            table1.addCell( saisir_cellule_tmp("Adresse : ",font,2));
            table1.completeRow();
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTel()!=null?ns.getTel():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCourrier()!=null?ns.getCourrier():"",4));
            table1.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse()!=null?ns.getAdresse():"",4));
            table1.completeRow();
            if(ns.getZf_et().equals("ET")){
                table1.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,2));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,2));
                table1.addCell( MyCell("قائمة النفايات CE",font,2));
                table1.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,2));
                table1.addCell( MyCell("بلد الاستيراد / الوجهة",font,2));
                table1.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,2));
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",4));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",4));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",4));
                table1.completeRow();
            }else{
                table1.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,3));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,3));
                table1.addCell( MyCell("الرمز الوطني في البلد المُستورد",font,3));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'importation",font,3));
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",6));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalIm()!=null?ns.getCodeNationalIm():"-",6));
                table1.completeRow();

                table1.addCell( MyCell("قائمة النفايات CE",font,3));
                table1.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,3));
                if(ns.getZf_et().equals("TR")){
                    table1.addCell( MyCell("بلد الاستيراد / الوجهة",font,3));
                    table1.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,3));
                }else if(ns.getZf_et().equals("XD")){
                    table1.addCell( MyCell("بلد التصدير / الإرسال",font,3));
                    table1.addCell( saisir_cellule_tmp("Pays d'exportation/d'éxpédition",font,3));
                }
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",6));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",6));
                table1.completeRow();
            }

        }
        else {

            //--------------------- Row Title ---------------------

            if(!ns.getZf_et().equals("ZF")){
                table1.addCell(saisir_cellule_titre1("المستورد - المتلقي",6));
                table1.addCell(saisir_cellule_titre("Importateur - Destinataire",6));
            }else {
                table1.addCell(saisir_cellule_titre1("المستورد - المخطر", 6));
                table1.addCell(saisir_cellule_titre("Importateur - Notifiant", 6));
            }
            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell(MyCell("إسم الشركة", font,2));
            table1.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
            table1.addCell(MyCell("البريد الاكتروني", font, 2));
            if(ns.getZf_et().equals("ET")) {
                table1.addCell(saisir_cellule_tmp("Courrier électonique", font, 2));
            }else {
                table1.addCell(saisir_cellule_tmp("Email", font, 2));
            }
            table1.addCell(MyCell("الهاتف", font,  2));
            table1.addCell(saisir_cellule_tmp("Télephone", font, 2));
            table1.completeRow();
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getNom_fr() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getMail() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getTel() : "-", 4));
            table1.completeRow();


            if(ns.getZf_et().equals("ET")) {
                table1.addCell(MyCell("الفاكس", font, 2));
                table1.addCell(saisir_cellule_tmp("Télécopie", font, 2));
                table1.addCell(MyCell("جهة الاتصال", font, 2));
                table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 2));

                table1.addCell(MyCell("العنوان", font, 2));
                table1.addCell(saisir_cellule_tmp("Adresse", font, 2));
                table1.completeRow();
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 4));
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 4));
                table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 4));
                table1.completeRow();
            }
            else {
                table1.addCell(MyCell("الفاكس", font, 3));
                table1.addCell(saisir_cellule_tmp("Fax", font, 3));
                table1.addCell(MyCell("جهة الاتصال", font, 3));
                table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
                table1.completeRow();
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 6));
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                table1.completeRow();
                table1.addCell(MyCell("العنوان", font, 6));
                table1.addCell(saisir_cellule_tmp("Adresse", font, 6));
                table1.completeRow();
                table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 12));
                table1.completeRow();
            }
        }


        //---------------------Tableau Autorite ----------------------


        PdfPTable table02 = new PdfPTable(12);
        table02.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table02.setWidthPercentage(100);
        table02.setSpacingBefore(12);
        table02.setSpacingAfter(12);
        if (ns.getZf_et().equals("XD")){
            //--------------------- Row Title ---------------------
            table02.addCell(saisir_cellule_titre1("هيئة الاستيراد",6));
            table02.addCell(saisir_cellule_titre("Autorité d'importation",6));

            table02.completeRow();
            //--------------------- completeRow ---------------------

            table02.addCell( MyCell("العنوان",font,2));
            table02.addCell( saisir_cellule_tmp("Adresse",font,2));
            table02.addCell( MyCell("الهاتف",font,2));
            table02.addCell( saisir_cellule_tmp("Télephone",font,2));
            table02.addCell( MyCell("الفاكس",font,2));
            table02.addCell( saisir_cellule_tmp("Fax",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_adresse(fontbold,ns.getAutorite()!=null?ns.getAutorite().getAdresse():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getTel():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getFax():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("البريد الاكتروني ",font,3));
            table02.addCell( saisir_cellule_tmp("Mail",font,3));
            table02.addCell( MyCell("بلد التصدير",font,3));
            table02.addCell( saisir_cellule_tmp("Pays d'exportation",font,3));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getEmail():"-",6));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",6));
            table02.completeRow();
        }else if(ns.getZf_et().equals("TR")){
            table02.addCell(saisir_cellule_titre1("هيئة العبور",6));
            table02.addCell(saisir_cellule_titre("Autorité de transit",6));

            table02.completeRow();
            //--------------------- completeRow ---------------------

            table02.addCell( MyCell("نوع",font,2));
            table02.addCell( saisir_cellule_tmp("Genre",font,2));
            table02.addCell( MyCell("الممثل",font,2));
            table02.addCell( saisir_cellule_tmp("Représentant",font,2));
            table02.addCell( MyCell("الجودة",font,2));
            table02.addCell( saisir_cellule_tmp("Qualité",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getGenre_A():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getDenomination():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getPoste():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("البريد الاكتروني ",font,2));
            table02.addCell( saisir_cellule_tmp("Mail",font,2));
            table02.addCell( MyCell("الهاتف",font,2));
            table02.addCell( saisir_cellule_tmp("Téléphone",font,2));
            table02.addCell( MyCell("الفاكس",font,2));
            table02.addCell( saisir_cellule_tmp("Fax",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getEmail():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getTel():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getFax():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("العنوان ",font,3));
            table02.addCell( saisir_cellule_tmp("Adresse",font,3));
            table02.addCell( MyCell("البلد",font,3));
            table02.addCell( saisir_cellule_tmp("Pays",font,3));
            table02.completeRow();
            table02.addCell( saisir_cellule_adresse(fontbold,ns.getAutorite()!=null?ns.getAutorite().getAdresse():"-",6));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",6));
            table02.completeRow();

            //--------------------- completeRow ---------------------

            table02.addCell(MyCell("البلد",font, 3));
            table02.addCell(saisir_cellule_tmp("Pays",font, 3));
            table02.addCell(MyCell("الهيئة ",font, 3));
            table02.addCell(saisir_cellule_tmp("Autorité ",font, 3));
            table02.completeRow();
            if (ns.getPaysAutorites() != null && ns.getPaysAutorites().size() > 0) {
                for (PaysAutorite tp : ns.getPaysAutorites()) {
                    table02.addCell(saisir_cellule(tp.getPays()!=null?tp.getPays().getNom_fr():"-", font, font, "", 6));
                    table02.addCell(saisir_cellule(tp.getDesc_autorite()!=null?tp.getDesc_autorite():"-", font, font, "", 6));
                    table02.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucune autorité.", fontbold, fontbold, "", 12);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table02.addCell(tmp);
            }
        }else{

        }

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(12);
        table2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre1("وثيقة الإخطار",6));
        table2.addCell(saisir_cellule_titre("Document de notification",6));

        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table2.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table2.addCell( MyCell("العملية",font,3));
        table2.addCell( saisir_cellule_tmp("Opération",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table2.completeRow();
        table2.addCell( MyCell("العدد الإجمالي لعمليات النقل المتوقعة",font,3));
        table2.addCell( saisir_cellule_tmp("Nombre total d'expéditions prévues",font,3));
        table2.addCell( MyCell("الخصائص الفيزيائية ",font,3));
        table2.addCell( saisir_cellule_tmp("Caractéristiques physiques",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getExpedition()!=null?ns.getExpedition():"",6));
        if(ns.getCaracteristquePhysique().getId_classification()!=5){
            table2.addCell( saisir_cellule_tmp2(fontbold,ns.getCaracteristquePhysique()!=null?ns.getCaracteristquePhysique().getNom_fr():"-",6));
        }else{
            table2.addCell( saisir_cellule_tmp2(fontbold,ns.getAutre()!=null?ns.getAutre():"-",6));
        }
        table2.completeRow();
        table2.addCell( MyCell("بخصوص الإخطار",font,3));
        table2.addCell( saisir_cellule_tmp("Notification Concernant",font,3));
        table2.addCell( MyCell("اسم الوجهة النهائية",font,3));
        table2.addCell( saisir_cellule_tmp("Destination finale",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getUniques()!=null?ns.getUniques():"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getDestination_final()!=null?ns.getDestination_final():"",6));
        table2.completeRow();
        table2.addCell( MyCell("أول مغادرة",font,3));
        table2.addCell( saisir_cellule_tmp("Premier départ",font,3));
        table2.addCell( MyCell("آخر مغادرة",font,3));
        table2.addCell( saisir_cellule_tmp("Dernier  départ",font,3));
        table2.completeRow();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getPremier()!=null? dateFormat.format(formatter.parse(ns.getPremier())) :"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getDernier()!=null? dateFormat.format(formatter.parse(ns.getDernier())):"",6));
        table2.completeRow();
        table2.addCell( MyCell("متطلبات المناولة الخاصة",font,6));
        table2.addCell( saisir_cellule_tmp("Prescriptions spéciales de manutention ",font,6));
        table2.completeRow();
        table2.addCell(saisir_cellule_tmp2(fontbold,ns.getManutention()!=null?ns.getManutention():"",12));
        table2.completeRow();
        table2.addCell( MyCell("نوع (أنواع) التغليف ",font,6));
        table2.addCell( saisir_cellule_tmp("Type(s) de conditionnement",font,6));
        table2.setSpacingAfter(12);
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getTypeconditionnement()!=null?ns.getTypeconditionnement().getNom_fr():"-",12));

        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table3 = new PdfPTable(8);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("XD") || (ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1)){
            table3.addCell(saisir_cellule_titre1("الناقل (الناقلات) الوطنية المقصودة", 4));
            table3.addCell(saisir_cellule_titre("Transporteur(s) national prévu", 4));

            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(MyCell("إسم الشركة",font, 1));
            table3.addCell(saisir_cellule_tmp("Nom",font, 1));
            table3.addCell(MyCell("الهاتف",font, 1));
            table3.addCell(saisir_cellule_tmp("Téléphone",font, 1));
            table3.addCell(MyCell("العنوان",font, 2));
            table3.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table3.completeRow();
            if (ns.getTransporteur() != null && ns.getTransporteur().size() > 0) {
                for (TransporteurParam tp : ns.getTransporteur()) {
                    table3.addCell(saisir_cellule_tmp2(font,tp.getNom(),2));
                    table3.addCell(saisir_cellule_tmp2(font,tp.getTel(), 2));
                    table3.addCell(saisir_cellule_adresse( font, tp.getAdresse(),4));
                    table3.completeRow();
                }
            }else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }else if(!ns.getZf_et().equals("TR") || (ns.getZf_et().equals("XD") || ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()!=1)){


            table3.addCell(saisir_cellule_titre1("الناقل (الناقلات) الوطنية المقصودة", 4));
            table3.addCell(saisir_cellule_titre("Transporteur(s) national prévu", 4));

            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(MyCell("إسم الشركة",font, 1));
            table3.addCell(saisir_cellule_tmp("Nom de la société",font, 1));
            table3.addCell(MyCell("نوع المواصلات",font, 1));
            table3.addCell(saisir_cellule_tmp("Type de transport",font, 1));
            table3.addCell(MyCell("العنوان", font,2));
            table3.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table3.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    if(tp.getType().equals("tn")) {
                        table3.addCell(saisir_cellule_tmp2(font,tp.getRaison_social(),2));
                        table3.addCell(saisir_cellule_tmp2(font,tp.getTypeVehicule(), 2));
                        table3.addCell(saisir_cellule_adresse( font, tp.getAdresse(),4));
                        table3.completeRow();
                    }

                }
            }else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }


        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table03= new PdfPTable(12);

        table03.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table03.setWidthPercentage(100);
        table03.setSpacingBefore(12);
        table03.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("ET") || ns.getZf_et().equals("XD") || ns.getZf_et().equals("TR")){
            table03.addCell(saisir_cellule_titre1("الناقل (الناقلات) الدولية", 6));
            table03.addCell(saisir_cellule_titre("Transporteur(s) International", 6));

            table03.completeRow();
            //--------------------- completeRow ---------------------
            table03.addCell(MyCell("إسم الشركة",font, 2));
            table03.addCell(saisir_cellule_tmp("Nom de la société",font, 2));
            table03.addCell(MyCell("نوع المواصلات",font, 2));
            table03.addCell(saisir_cellule_tmp("Type de transport",font, 2));
            table03.addCell(MyCell("العنوان", font,2));
            table03.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table03.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    if(tp.getType().equals("ti")){
                        table03.addCell(saisir_cellule(tp.getRaison_social(), font, font, "", 4));
                        table03.addCell(saisir_cellule(tp.getTypeVehicule(), font, font, "", 4));
                        table03.addCell(saisir_cellule(tp.getAdresse(), font, font, "", 4));
                        table03.completeRow();
                    }
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table03.addCell(tmp);
            }
        }

        //--------------------- Tableau Producteur(s) ---------------------
        PdfPTable table4 = new PdfPTable(24);
        table4.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table4.setWidthPercentage(100);
        table4.setSpacingBefore(12);
        table4.setSpacingAfter(12);
        if(ns.getZf_et().equals("XD")){
            table4.addCell(saisir_cellule_titre1("المنتج (المنتجين)",12));
            table4.addCell(saisir_cellule_titre("Producteurs", 12));

            table4.completeRow();
            //--------------------- completeRow ---------------------
            table4.addCell(MyCell("جهة الاتصال",font, 3));
            table4.addCell(saisir_cellule_tmp("Personne à contacter",font, 3));
            table4.addCell(MyCell("الهاتف ",font, 3));
            table4.addCell(saisir_cellule_tmp("Télephone ",font, 3));
            table4.addCell(MyCell("البريد الإلكتروني",font, 3));
            table4.addCell(saisir_cellule_tmp("Email",font, 3));
            table4.addCell(MyCell("العنوان", font,3));
            table4.addCell(saisir_cellule_tmp("Adresse",font, 3));
            table4.completeRow();
            if (ns.getProducteurs() != null && ns.getProducteurs().size() > 0) {
                for (Producteur tp : ns.getProducteurs()) {
                    table4.addCell(saisir_cellule(tp.getContact_fr(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getTel(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getMail(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getAdresse_fr(), font, font, "", 6));
                    table4.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Producteur.", fontbold, fontbold, "", 24);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table4.addCell(tmp);
            }
        }else {
            //--------------------- Row Title ---------------------
            if(ns.getZf_et().equals("ET")) {
                table4.addCell(saisir_cellule_titre1("مولد النفايات", 12));
                table4.addCell(saisir_cellule_titre("Producteur de déchets", 12));
            }else {
                table4.addCell(saisir_cellule_titre1("المنتج", 12));
                table4.addCell(saisir_cellule_titre("Producteur", 12));
            }

            table4.completeRow();
            //--------------------- completeRow ---------------------
            table4.addCell(MyCell("إسم الشركة", font, 4));
            table4.addCell(saisir_cellule_tmp("Nom de la société",font, 4));
            table4.addCell(MyCell("الهاتف", font,  4));
            table4.addCell(saisir_cellule_tmp("Téléphone", font,  4));
            table4.addCell(MyCell("الفاكس", font,  4));
            table4.addCell(saisir_cellule_tmp("Fax", font,  4));
            table4.completeRow();
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getNom_fr() : "-", 8));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getTel() : "-", 8));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getFax() : "-", 8));
            table4.completeRow();
            table4.addCell(MyCell("البريد الإلكتروني", font,  6));
            table4.addCell(saisir_cellule_tmp("Email", font, 6));

            table4.addCell(MyCell("جهة الاتصال", font,  6));
            table4.addCell(saisir_cellule_tmp("Personne à contacter", font, 6));
            table4.completeRow();
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getMail() : "-", 12));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getContact_fr() : "-", 12));
            table4.completeRow();
            table4.addCell(MyCell("العنوان", font,  12));
            table4.addCell(saisir_cellule_tmp("Adresse", font,  12));
            table4.completeRow();
            table4.addCell(saisir_cellule_adresse(fontbold, ns.getProducteur() != null ? ns.getProducteur().getAdresse_fr() : "-", 24));
            table4.setSpacingAfter(12);
        }


        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5 = new PdfPTable(12);

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table5.setWidthPercentage(100);
        table5.setSpacingBefore(12);
        table5.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table5.addCell(saisir_cellule_titre1("منشأة التثمين / التخلص",6));
        table5.addCell(saisir_cellule_titre("Installation de valorisation / élimination",6));

        table5.completeRow();
        //--------------------- completeRow ---------------------
        table5.addCell( MyCell("إسم الشركة ",font,2));
        table5.addCell( saisir_cellule_tmp("Nom de la société",font,2));
        table5.addCell( MyCell("الهاتف",font,2));
        table5.addCell( saisir_cellule_tmp("Téléphone",font,2));
        table5.addCell( MyCell("البريد الإلكتروني",font,2));
        table5.addCell( saisir_cellule_tmp("Email",font,2));
        table5.completeRow();
        table5.addCell(saisir_cellule_tmp2(fontbold, ns.getEliminateur() != null ? ns.getEliminateur().getNom_fr() : "-", 4));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getTel():"-",4));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getMail():"-",4));
        table5.completeRow();
        table5.addCell( MyCell("الفاكس",font,3));
        table5.addCell( saisir_cellule_tmp("Fax",font,3));
        table5.addCell( MyCell("جهة الاتصال",font,3));
        table5.addCell( saisir_cellule_tmp("Personne à contacter",font,3));
        table5.completeRow();
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getFax():"-",6));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getContact_fr():"-",6));
        table5.completeRow();
        table5.addCell( MyCell("العنوان",font,6));
        table5.addCell( saisir_cellule_tmp("Adresse",font,6));
        table5.completeRow();
        table5.addCell( saisir_cellule_adresse(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getAdresse_fr():"-",12));
        table5.completeRow();
        table5.setSpacingAfter(12);


        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5x = new PdfPTable(12);
        table5x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table5x.setWidthPercentage(100);
        table5x.setSpacingBefore(12);

        PdfPTable table6x = new PdfPTable(12);
        table6x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table6x.setWidthPercentage(100);
        table6x.setSpacingAfter(12);
        if(ns.getZf_et().equals("ZF")) {

            //--------------------- Row Title ---------------------
            table5x.addCell(saisir_cellule_titre1("شهادة التصرف", 6));
            table5x.addCell(saisir_cellule_titre("Certificat d'élimination", 6));

            table5x.completeRow();
            if(ns.getUrl_certicat_elimination()!=null) {
                //--------------------- completeRow ---------------------
                table5x.addCell(MyCell("عدد الطرود", font, 3));
                table5x.addCell(saisir_cellule_tmp("Nombre de colis", font,  3));
                table5x.addCell(MyCell("الكمية المتوقعة", font, 3));
                table5x.addCell(saisir_cellule_tmp("Quantité prévue", font,  3));
                table5x.completeRow();
                table5x.addCell(saisir_cellule_tmp2(fontbold, ns.getNbr_colis() != null ? ns.getNbr_colis() : "-", 6));
                table5x.addCell(saisir_cellule_tmp2(fontbold, ns.getQuantite() != null ? ns.getQuantite() : "-", 6));
                table5x.completeRow();
                table6x.addCell(MyCell("تاريخ التحقق من صحة الشهادة", font, 3));
                table6x.addCell(saisir_cellule_tmp("Date de validation du certificat", font, 3));
                table6x.addCell(MyCell("الكمية",font, 3));
                table6x.addCell(saisir_cellule_tmp("Quantité",font, 3));
                table6x.completeRow();
                for (DetailDocumentMouvement dm : ns.getDocMouvement()) {
                    if (ns.getDocMouvement().size() == 0) {
                        table6x.addCell(saisir_cellule("Aucune Quantite", font, font, "", 12));
                        table6x.completeRow();
                        table6x.setSpacingAfter(12);
                    } else {
                        table6x.addCell(saisir_cellule_tmp2(fontbold, ns.getDateValidation() != null ? dateFormat.format(ns.getDateValidation()) : "", 6));
                        table6x.addCell(saisir_cellule(dm.getQuantite(), font, font, "", 6));
                        table6x.completeRow();
                        table6x.setSpacingAfter(12);
                    }
                }
            }
            else {
                table6x.addCell(saisir_cellule("", font, font, "", 12));
            }
        }

        PdfPTable tablex5 = new PdfPTable(12);
        tablex5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        tablex5.setWidthPercentage(100);
        tablex5.setSpacingBefore(12);
        tablex5.setSpacingAfter(12);
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1) {

            //--------------------- Row Title ---------------------
            tablex5.addCell(saisir_cellule_titre1("تغيير الناقل", 6));
            tablex5.addCell(saisir_cellule_titre("Changement du transporteur", 6));
            tablex5.completeRow();

            if (dt!=null && dt.getEtat() != null ) {
                //--------------------- completeRow ---------------------
                tablex5.addCell(MyCell("إسم الشركة",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Nom de la société", font,2));
                tablex5.addCell(MyCell("الهاتف ",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Télephone ",font, 2));
                tablex5.addCell(MyCell("العنوان",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Adresse", font,2));
                tablex5.completeRow();
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getNom(), font, font, "", 4));
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getTel(), font, font, "", 4));
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getAdresse(), font, font, "", 4));
                tablex5.completeRow();

            }
            else {
                PdfPCell tmpX = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 12);
                tmpX.setHorizontalAlignment(Element.ALIGN_CENTER);
                tablex5.addCell(tmpX);
            }
        }



        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب ",6));
        table7.addCell(saisir_cellule_titre("Pièces accompagnant la demande",6));
        table7.completeRow();

        //table7.addCell(new Paragraph(Chunk.NEWLINE));
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }

        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table6 = new PdfPTable(12);
        table6.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table6.setWidthPercentage(100);
        table6.setSpacingBefore(12);
        table6.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table6.addCell(saisir_cellule_titre1("وثيقة حركة النفايات",6));
        table6.addCell(saisir_cellule_titre("Document de mouvements des déchets",6));
        table6.completeRow();
        //--------------------- completeRow ---------------------
        table6.addCell( MyCell("الكمية الفعلية",font,2));
        table6.addCell( saisir_cellule_tmp("Quantité réelle",font,2));
        table6.addCell( MyCell("الوحدة",font,2));
        table6.addCell( saisir_cellule_tmp("Unité",font,2));
        table6.addCell( MyCell("عدد الطرود",font,2));
        table6.addCell( saisir_cellule_tmp("Nombre de colis",font,2));
        table6.completeRow();
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite_reel()!=null ? ns.getQuantite_reel() :"",4));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",4));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getNbr_colis()!=null?ns.getNbr_colis():"",4));
        table6.completeRow();
        table6.addCell( MyCell("التاريخ الفعلي للشحن",font,3));
        table6.addCell( saisir_cellule_tmp("Date réelle de l'expédition",font,3));
        table6.addCell( MyCell("المكان الفعلي للتثمين / التخلص",font,3));
        table6.addCell( saisir_cellule_tmp("Lieu effectif de l'élimination/valorisation",font,3));
        table6.completeRow();
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getDate_reel()!=null ? dateFormat.format(ns.getDate_reel()):"",6));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getLieux_elimination()!=null?ns.getLieux_elimination().getNom_fr():ns.getLieu(),6));
        table6.completeRow();
        table6.setSpacingAfter(12);

        String num_notification = ns.getNum_notification()!=null?ns.getNum_notification():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_imp/"
                + ns.getId_notification(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);




        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table1);
        document.add(table02);
        document.add(table2);
        document.add(table3);
        document.add(table03);
        document.add(table4);
        document.add(table5);
        document.add(table6);
        document.add(table5x);
        document.add(table6x);
        document.add(tablex5);
        document.add(table7);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }



    public static ByteArrayInputStream generateDocumentGeneraleDemandeNum(Notification ns,ListDocNotif[] l,DeclarationTransporteur dt,String url) throws DocumentException, IOException, ParseException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font font_sm=new Font(base,8.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        String title_type = "...";
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1){
            title_type = "d'importation des déchets d'une zone franche dangereux";
        }else if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==2){
            title_type = "d'importation des déchets d'une zone franche non dangereux";
        }else if(ns.getZf_et().equals("ET")){
            title_type = "d'importation des déchets non dangereux d'un pays étranger";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==1){
            title_type = "d'exportation des déchets dangereux";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==2){
            title_type = "d'exportation des déchets non dangereux";
        }else if(ns.getZf_et().equals("TR")){
            title_type = "Transit des déchets";
        }
        headerPar.add("Reçu de dépôt de la demande d'autorisation "+title_type);
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de notification ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("رقم الإخطار",6));
        table0.addCell(saisir_cellule_titre("Numéro de notification",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الإخطار",font,3));
        table0.addCell( saisir_cellule_tmp("Numéro de notification",font,3));
        table0.addCell( MyCell("تصنيف النفايات ",font,3));
        table0.addCell( saisir_cellule_tmp("Classification des déchets",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_notification(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getClassification()!=null?ns.getClassification().getNom_fr():"-",6));
        table0.completeRow();
        table0.addCell( MyCell("الرمز ",font,3));
        table0.addCell( saisir_cellule_tmp("Code",font,3));
        table0.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table0.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?RTL_LTR(ns.getCode().getNom_fr()):"-",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table0.completeRow();
        table0.addCell( MyCell("العملية",font,3));
        table0.addCell( saisir_cellule_tmp("Opération",font,3));
        table0.addCell( MyCell("وحدة",font,3));
        table0.addCell( saisir_cellule_tmp("Unité",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",6));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(MyCell("المنطقة الحرة", font, 3));
            table0.addCell(saisir_cellule_tmp("Zone Franche", font, 3));
        }else if(ns.getZf_et().equals("ET")) {
            table0.addCell(MyCell("بلد أجنبي", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays étranger", font, 3));
        }
        else {
            table0.addCell(MyCell("بلد التصدير ", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays d'exportation", font, 3));
        }


        table0.addCell( MyCell("نوع النفايات",font,3));
        table0.addCell( saisir_cellule_tmp("Type de déchet",font,3));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getZonneFranche() != null ? ns.getZonneFranche().getNom_fr() : "-", 6));
        }else {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getPays() != null ? ns.getPays().getNom_fr() : "-", 6));
        }
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?ns.getCode().getNom_ar():"-",6));

        //---------------------Tableau Exportateur - Notifiant ----------------------


        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        if (ns.getZf_et().equals("XD") || ns.getZf_et().equals("TR") || ns.getZf_et().equals("ET")){
            table01.setWidthPercentage(100);
            table01.setSpacingBefore(12);
            table01.setSpacingAfter(12);

            //--------------------- Row Title ---------------------
            table01.addCell(saisir_cellule_titre1("المصدر - المخطر ",6));
            table01.addCell(saisir_cellule_titre("Exportateur - Notifiant",6));
            table01.completeRow();
            //--------------------- completeRow ---------------------

            if(ns.getZf_et().equals("TR")) {
                table01.addCell(MyCell("اسم المصدر المخطر", font, 3));
                table01.addCell(saisir_cellule_tmp("Nom de l'exportateur Notifiant", font, 3));
                table01.addCell(MyCell("البريد الالكتروني", font, 3));
                table01.addCell(saisir_cellule_tmp("Courrier électronique", font, 3));

                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getNom(), 6));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getCourrier(),6));
                table01.completeRow();
                table01.addCell(MyCell("الهاتف", font, 3));
                table01.addCell(saisir_cellule_tmp("Télephone", font, 3));
                table01.addCell(MyCell("فاكس", font, 3));
                table01.addCell(saisir_cellule_tmp("Télécopie", font, 3));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTel(), 6));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTelecopie(), 6));
                table01.completeRow();

                table01.addCell( MyCell("جهة الاتصال",font,3));
                table01.addCell( saisir_cellule_tmp("Personne à contacter",font,3));
                table01.addCell( MyCell("العنوان",font,3));
                table01.addCell( saisir_cellule_tmp("Adresse",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getPersonne(),6));
                table01.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse(),6));
                table01.completeRow();

                table01.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,3));
                table01.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,3));
                table01.addCell( MyCell("الرمز الوطني في البلد المُستورد",font,3));
                table01.addCell( saisir_cellule_tmp("Code National dans le pays d'importation",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",6));
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalIm()!=null?ns.getCodeNationalIm():"-",6));
                table01.completeRow();

                table01.addCell( MyCell("قائمة النفايات CE",font,3));
                table01.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,3));
                table01.addCell( MyCell("بلد الاستيراد / الوجهة",font,3));
                table01.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,3));
                table01.completeRow();
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",6));
                table01.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",6));
                table01.completeRow();
            }
            else{
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(MyCell("اسم المصدر المخطر", font, 2));
                    table01.addCell(saisir_cellule_tmp("Nom de l'exportateur notifiant", font, 2));
                }
                else {
                    table01.addCell(MyCell("إسم الشركة", font, 2));
                    table01.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
                }
                table01.addCell(MyCell("البريد الالكتروني", font, 2));
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(saisir_cellule_tmp("Courrier électonique", font, 2));
                }else {
                    table01.addCell(saisir_cellule_tmp("Email", font, 2));
                }
                table01.addCell(MyCell("الهاتف", font, 2));
                table01.addCell(saisir_cellule_tmp("Télephone", font, 2));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold,  ns.getNom(), 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getCourrier(), 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTel(), 4));
                table01.completeRow();
                table01.addCell(MyCell("فاكس", font, 2));
                if(ns.getZf_et().equals("ET")){
                    table01.addCell(saisir_cellule_tmp("Télécopie", font, 2));
                }else{
                    table01.addCell(saisir_cellule_tmp("Fax", font, 2));
                }

                table01.addCell(MyCell("الجهة", font, 2));
                table01.addCell(saisir_cellule_tmp("Région", font, 2));
                table01.addCell(MyCell("المحافظة", font, 2));
                table01.addCell(saisir_cellule_tmp("Préfecture", font, 2));
                table01.completeRow();
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getTelecopie(), 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getRegion() != null ? ns.getRegion().getNom_fr() : "-", 4));
                table01.addCell(saisir_cellule_tmp2(fontbold, ns.getPrefecture() != null ? ns.getPrefecture().getNom_fr() : "-", 4));
                table01.completeRow();
                if(ns.getZf_et().equals("ET")) {
                    table01.addCell(MyCell("جهة الاتصال", font, 3));
                    table01.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));

                    table01.addCell(MyCell("العنوان", font, 3));
                    table01.addCell(saisir_cellule_tmp("Adresse", font, 3));
                    table01.completeRow();
                    table01.addCell(saisir_cellule_tmp2(fontbold, ns.getPersonne(), 6));
                    table01.addCell(saisir_cellule_adresse(fontbold, ns.getAdresse(), 6));
                    table01.completeRow();

                    table01.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,2));
                    table01.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,2));
                    table01.addCell( MyCell("قائمة النفايات CE",font,2));
                    table01.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,2));
                    table01.addCell( MyCell("بلد الاستيراد / الوجهة",font,2));
                    table01.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,2));
                    table01.completeRow();
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"-",4));
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",4));
                    table01.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",4));
                    table01.completeRow();
                }
                else{
                    table01.addCell(MyCell("جهة الاتصال", font, 3));
                    table01.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
                    table01.addCell(MyCell("العنوان", font, 3));
                    table01.addCell(saisir_cellule_tmp("Adresse", font, 3));
                    table01.completeRow();
                    table01.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                    table01.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 6));
                    table01.completeRow();
                }
            }

        }

        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);
        if (ns.getZf_et().equals("XD")) {

            //--------------------- Row Title ---------------------
            table1.addCell(saisir_cellule_titre1("المستورد - المتلقي",6));
            table1.addCell(saisir_cellule_titre("Importateur - Destinataire",6));
            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell( MyCell("اسم المستورد المتلقي",font,2));
            table1.addCell( saisir_cellule_tmp("Nom de l'importateur destinataire",font,2));
            table1.addCell( MyCell("الفاكس",font,2));
            table1.addCell( saisir_cellule_tmp("Télécopie",font,2));
            table1.addCell( MyCell("جهة الاتصال",font,2));
            table1.addCell( saisir_cellule_tmp("Personne à contacter",font,2));
            table1.completeRow();
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getNom()!=null?ns.getNom():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTelecopie()!=null?ns.getTelecopie():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getPersonne()!=null?ns.getPersonne():"",4));
            table1.completeRow();
            table1.addCell( MyCell("الهاتف",font,2));
            table1.addCell( saisir_cellule_tmp("Téléphone",font,2));
            table1.addCell( MyCell("البريد الالكتروني",font,2));
            table1.addCell( saisir_cellule_tmp("courrier électronique",font,2));
            table1.addCell( MyCell("عنوان",font,2));
            table1.addCell( saisir_cellule_tmp("Adresse",font,2));
            table1.completeRow();
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getTel()!=null?ns.getTel():"",4));
            table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCourrier()!=null?ns.getCourrier():"",4));
            table1.addCell( saisir_cellule_adresse(fontbold,ns.getAdresse()!=null?ns.getAdresse():"",4));
            table1.completeRow();
            if(ns.getZf_et().equals("ET")){
                table1.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,2));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,2));
                table1.addCell( MyCell("قائمة النفايات CE",font,2));
                table1.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,2));
                table1.addCell( MyCell("بلد الاستيراد / الوجهة",font,2));
                table1.addCell( saisir_cellule_tmp("Pays d'importation/ de destination",font,2));
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",4));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",4));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",4));
                table1.completeRow();
            }else{
                table1.addCell( MyCell("الرمز الوطني في البلد المُصدر",font,3));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'exportation",font,3));
                table1.addCell( MyCell("الرمز الوطني في البلد المُستورد",font,3));
                table1.addCell( saisir_cellule_tmp("Code National dans le pays d'importation",font,3));
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalXD()!=null?ns.getCodeNationalXD():"",6));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeNationalIm()!=null?ns.getCodeNationalIm():"-",6));
                table1.completeRow();

                table1.addCell( MyCell("قائمة النفايات CE",font,3));
                table1.addCell( saisir_cellule_tmp("Liste Des déchets dans la CE",font,3));
                if(ns.getZf_et().equals("XD")){
                    table1.addCell( MyCell("بلد التصدير / الإرسال",font,3));
                    table1.addCell( saisir_cellule_tmp("Pays d'exportation/d'éxpédition",font,3));
                }
                table1.completeRow();
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getCodeCE()!=null?ns.getCodeCE():"-",6));
                table1.addCell( saisir_cellule_tmp2(fontbold,ns.getEtat()!=null?ns.getEtat():"-",6));
                table1.completeRow();
            }



        }
        else {

            //--------------------- Row Title ---------------------
            if(!ns.getZf_et().equals("ZF")){
                table1.addCell(saisir_cellule_titre1("المستورد - المتلقي", 6));
                table1.addCell(saisir_cellule_titre("Importateur - Destinataire", 6));
            }else{
                table1.addCell(saisir_cellule_titre1("المستورد - المخطر", 6));
                table1.addCell(saisir_cellule_titre("Importateur - Notifiant", 6));
            }


            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell(MyCell("إسم الشركة", font,2));
            table1.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
            table1.addCell(MyCell("البريد الاكتروني", font, 2));
            if(ns.getZf_et().equals("ET")) {
                table1.addCell(saisir_cellule_tmp("Courrier électonique", font, 2));
            }else {
                table1.addCell(saisir_cellule_tmp("Email", font, 2));
            }
            table1.addCell(MyCell("الهاتف", font,  2));
            table1.addCell(saisir_cellule_tmp("Télephone", font, 2));
            table1.completeRow();
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getNom_fr() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getMail() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getTel() : "-", 4));
            table1.completeRow();


            if(ns.getZf_et().equals("ET")) {
                table1.addCell(MyCell("الفاكس", font, 2));
                table1.addCell(saisir_cellule_tmp("Télécopie", font, 2));
                table1.addCell(MyCell("جهة الاتصال", font, 2));
                table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 2));

                table1.addCell(MyCell("العنوان", font, 2));
                table1.addCell(saisir_cellule_tmp("Adresse", font, 2));
                table1.completeRow();
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 4));
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 4));
                table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 4));
                table1.completeRow();
            }
            else {
                table1.addCell(MyCell("الفاكس", font, 3));
                table1.addCell(saisir_cellule_tmp("Fax", font, 3));
                table1.addCell(MyCell("جهة الاتصال", font, 3));
                table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
                table1.completeRow();
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 6));
                table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
                table1.completeRow();
                table1.addCell(MyCell("العنوان", font, 6));
                table1.addCell(saisir_cellule_tmp("Adresse", font, 6));
                table1.completeRow();
                table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 12));
                table1.completeRow();
            }


        }


        //---------------------Tableau Autorite ----------------------


        PdfPTable table02 = new PdfPTable(12);
        table02.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table02.setWidthPercentage(100);
        table02.setSpacingBefore(12);
        table02.setSpacingAfter(12);
        if (ns.getZf_et().equals("XD")){
            //--------------------- Row Title ---------------------
            table02.addCell(saisir_cellule_titre1("هيئة الاستيراد",6));
            table02.addCell(saisir_cellule_titre("Autorité d'importation",6));

            table02.completeRow();
            //--------------------- completeRow ---------------------

            table02.addCell( MyCell("العنوان",font,2));
            table02.addCell( saisir_cellule_tmp("Adresse",font,2));
            table02.addCell( MyCell("الهاتف",font,2));
            table02.addCell( saisir_cellule_tmp("Télephone",font,2));
            table02.addCell( MyCell("الفاكس",font,2));
            table02.addCell( saisir_cellule_tmp("Fax",font,2));
            table02.completeRow();
            table02.addCell( saisir_cellule_adresse(fontbold,ns.getAutorite()!=null?ns.getAutorite().getAdresse():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getTel():"-",4));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getFax():"-",4));
            table02.completeRow();
            table02.addCell( MyCell("البريد الاكتروني ",font,3));
            table02.addCell( saisir_cellule_tmp("Mail",font,3));
            table02.addCell( MyCell("بلد التصدير",font,3));
            table02.addCell( saisir_cellule_tmp("Pays d'exportation",font,3));
            table02.completeRow();
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getAutorite()!=null?ns.getAutorite().getEmail():"-",6));
            table02.addCell( saisir_cellule_tmp2(fontbold,ns.getPays()!=null?ns.getPays().getNom_fr():"-",6));
            table02.completeRow();
        }else if(ns.getZf_et().equals("TR")){

        }else{

        }

        //--------------------- Tableau Document de notification ---------------------
        PdfPTable table2 = new PdfPTable(12);
        table2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table2.setWidthPercentage(100);
        table2.setSpacingBefore(12);
        table2.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table2.addCell(saisir_cellule_titre1("وثيقة الإخطار",6));
        table2.addCell(saisir_cellule_titre("Document de notification",6));

        table2.completeRow();
        //--------------------- completeRow ---------------------
        table2.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table2.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table2.addCell( MyCell("العملية",font,3));
        table2.addCell( saisir_cellule_tmp("Opération",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table2.completeRow();
        table2.addCell( MyCell("العدد الإجمالي لعمليات النقل المتوقعة",font,3));
        table2.addCell( saisir_cellule_tmp("Nombre total d'expéditions prévues",font,3));
        table2.addCell( MyCell("الخصائص الفيزيائية ",font,3));
        table2.addCell( saisir_cellule_tmp("Caractéristiques physiques",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getExpedition()!=null?ns.getExpedition():"",6));
        if(ns.getCaracteristquePhysique().getId_classification()!=5){
            table2.addCell( saisir_cellule_tmp2(fontbold,ns.getCaracteristquePhysique()!=null?ns.getCaracteristquePhysique().getNom_fr():"-",6));
        }else{
            table2.addCell( saisir_cellule_tmp2(fontbold,ns.getAutre()!=null?ns.getAutre():"-",6));
        }
        table2.completeRow();
        table2.addCell( MyCell("بخصوص الإخطار",font,3));
        table2.addCell( saisir_cellule_tmp("Notification Concernant",font,3));
        table2.addCell( MyCell("اسم الوجهة النهائية",font,3));
        table2.addCell( saisir_cellule_tmp("Destination finale",font,3));
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getUniques()!=null?ns.getUniques():"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getDestination_final()!=null?ns.getDestination_final():"",6));
        table2.completeRow();
        table2.addCell( MyCell("أول مغادرة",font,3));
        table2.addCell( saisir_cellule_tmp("Premier départ",font,3));
        table2.addCell( MyCell("آخر مغادرة",font,3));
        table2.addCell( saisir_cellule_tmp("Dernier  départ",font,3));
        table2.completeRow();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getPremier()!=null?dateFormat.format(formatter.parse(ns.getPremier())):"",6));
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getDernier()!=null?dateFormat.format(formatter.parse(ns.getDernier())):"",6));
        table2.completeRow();
        table2.addCell( MyCell("متطلبات المناولة الخاصة",font,6));
        table2.addCell( saisir_cellule_tmp("Prescriptions spéciales de manutention ",font,6));
        table2.completeRow();
        table2.addCell(saisir_cellule_tmp2(fontbold,ns.getManutention()!=null?ns.getManutention():"",12));
        table2.completeRow();
        table2.addCell( MyCell("نوع (أنواع) التغليف ",font,6));
        table2.addCell( saisir_cellule_tmp("Type(s) de conditionnement",font,6));
        table2.setSpacingAfter(12);
        table2.completeRow();
        table2.addCell( saisir_cellule_tmp2(fontbold,ns.getTypeconditionnement()!=null?ns.getTypeconditionnement().getNom_fr():"-",12));

        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table3 = new PdfPTable(8);
        table3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table3.setWidthPercentage(100);
        table3.setSpacingBefore(12);
        table3.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("XD") || (ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1)){
            table3.addCell(saisir_cellule_titre1("الناقل (الناقلات) الوطنية المقصودة", 4));
            table3.addCell(saisir_cellule_titre("Transporteur(s) national prévu", 4));

            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(MyCell("إسم الشركة",font, 1));
            table3.addCell(saisir_cellule_tmp("Nom",font, 1));
            table3.addCell(MyCell("الهاتف",font, 1));
            table3.addCell(saisir_cellule_tmp("Téléphone",font, 1));
            table3.addCell(MyCell("العنوان",font, 2));
            table3.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table3.completeRow();
            if (ns.getTransporteur() != null && ns.getTransporteur().size() > 0) {
                for (TransporteurParam tp : ns.getTransporteur()) {
                    table3.addCell(saisir_cellule_tmp2(font,tp.getNom(),2));
                    table3.addCell(saisir_cellule_tmp2(font,tp.getTel(), 2));
                    table3.addCell(saisir_cellule_adresse( font, tp.getAdresse(),4));
                    table3.completeRow();
                }
            }else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }else if(!ns.getZf_et().equals("TR") || (ns.getZf_et().equals("XD") || ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()!=1)){


            table3.addCell(saisir_cellule_titre1("الناقل (الناقلات) الوطنية المقصودة", 4));
            table3.addCell(saisir_cellule_titre("Transporteur(s) national prévu", 4));

            table3.completeRow();
            //--------------------- completeRow ---------------------
            table3.addCell(MyCell("إسم الشركة",font, 1));
            table3.addCell(saisir_cellule_tmp("Nom de la société",font, 1));
            table3.addCell(MyCell("نوع المواصلات",font, 1));
            table3.addCell(saisir_cellule_tmp("Type de transport",font, 1));
            table3.addCell(MyCell("العنوان", font,2));
            table3.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table3.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    if(tp.getType().equals("tn")) {
                        table3.addCell(saisir_cellule_tmp2(font,tp.getRaison_social(),2));
                        table3.addCell(saisir_cellule_tmp2(font,tp.getTypeVehicule(), 2));
                        table3.addCell(saisir_cellule_adresse( font, tp.getAdresse(),4));
                        table3.completeRow();
                    }

                }
            }else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table3.addCell(tmp);
            }
        }


        //--------------------- Tableau Transporteur(s) prévu ---------------------
        PdfPTable table03 =  new PdfPTable(12);
        table03.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table03.setWidthPercentage(100);
        table03.setSpacingBefore(12);
        table03.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        if(ns.getZf_et().equals("ET") || ns.getZf_et().equals("XD") || ns.getZf_et().equals("TR")){
            table03.addCell(saisir_cellule_titre1("الناقل (الناقلات) الدولية", 6));
            table03.addCell(saisir_cellule_titre("Transporteur(s) International", 6));

            table03.completeRow();
            //--------------------- completeRow ---------------------
            table03.addCell(MyCell("إسم الشركة",font, 2));
            table03.addCell(saisir_cellule_tmp("Nom de la société",font, 2));
            table03.addCell(MyCell("نوع المواصلات",font, 2));
            table03.addCell(saisir_cellule_tmp("Type de transport",font, 2));
            table03.addCell(MyCell("العنوان", font,2));
            table03.addCell(saisir_cellule_tmp("Adresse",font, 2));
            table03.completeRow();
            if (ns.getTransporteur_etranger() != null && ns.getTransporteur_etranger().size() > 0) {
                for (TransporteurEtranger tp : ns.getTransporteur_etranger()) {
                    if(tp.getType().equals("ti")){
                        table03.addCell(saisir_cellule(tp.getRaison_social(), font, font, "", 4));
                        table03.addCell(saisir_cellule(tp.getTypeVehicule(), font, font, "", 4));
                        table03.addCell(saisir_cellule(tp.getAdresse(), font, font, "", 4));
                        table03.completeRow();
                    }
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 8);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table03.addCell(tmp);
            }
        }

        //--------------------- Tableau Producteur(s) ---------------------
        PdfPTable table4 = new PdfPTable(24);
        table4.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table4.setWidthPercentage(100);
        table4.setSpacingBefore(12);
        table4.setSpacingAfter(12);
        if(ns.getZf_et().equals("XD")){
            table4.addCell(saisir_cellule_titre1("المنتج (المنتجون)",12));
            table4.addCell(saisir_cellule_titre("Producteur(s) ", 12));

            table4.completeRow();
            //--------------------- completeRow ---------------------
            table4.addCell(MyCell("جهة الاتصال",font, 3));
            table4.addCell(saisir_cellule_tmp("Personne à contacter",font, 3));
            table4.addCell(MyCell("الهاتف ",font, 3));
            table4.addCell(saisir_cellule_tmp("Télephone ",font, 3));
            table4.addCell(MyCell("البريد الإلكتروني",font, 3));
            table4.addCell(saisir_cellule_tmp("Email",font, 3));
            table4.addCell(MyCell("العنوان", font,3));
            table4.addCell(saisir_cellule_tmp("Adresse",font, 3));
            table4.completeRow();
            if (ns.getProducteurs() != null && ns.getProducteurs().size() > 0) {
                for (Producteur tp : ns.getProducteurs()) {
                    table4.addCell(saisir_cellule(tp.getContact_fr(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getTel(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getMail(), font, font, "", 6));
                    table4.addCell(saisir_cellule(tp.getAdresse_fr(), font, font, "", 6));
                    table4.completeRow();
                }
            } else {
                PdfPCell tmp = saisir_cellule("Aucun Producteur.", fontbold, fontbold, "", 24);
                tmp.setHorizontalAlignment(Element.ALIGN_CENTER);
                table4.addCell(tmp);
            }
        }
        else{
            //--------------------- Row Title ---------------------
            if(ns.getZf_et().equals("ET")){
                table4.addCell(saisir_cellule_titre1("مولد النفايات", 12));
                table4.addCell(saisir_cellule_titre("Producteur de déchets", 12));
            }else{
                table4.addCell(saisir_cellule_titre1("المنتج", 12));
                table4.addCell(saisir_cellule_titre("Producteur", 12));
            }


            table4.completeRow();
            //--------------------- completeRow ---------------------
            table4.addCell(MyCell("إسم الشركة", font, 4));
            table4.addCell(saisir_cellule_tmp("Nom de la société",font, 4));

            table4.addCell(MyCell("الهاتف", font,  4));
            table4.addCell(saisir_cellule_tmp("Téléphone", font,  4));
            table4.addCell(MyCell("الفاكس", font,  4));
            table4.addCell(saisir_cellule_tmp("Fax", font,  4));
            table4.completeRow();
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getNom_fr() : "-", 8));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getTel() : "-", 8));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getFax() : "-", 8));
            table4.completeRow();
            table4.addCell(MyCell("البريد الإلكتروني", font,  6));
            table4.addCell(saisir_cellule_tmp("Email", font, 6));
            table4.addCell(MyCell("جهة الاتصال", font,  6));
            table4.addCell(saisir_cellule_tmp("Personne à contacter", font, 6));
            table4.completeRow();
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getMail() : "-", 12));
            table4.addCell(saisir_cellule_tmp2(fontbold, ns.getProducteur() != null ? ns.getProducteur().getContact_fr() : "-", 12));
            table4.completeRow();
            table4.addCell(MyCell("العنوان", font,  12));
            table4.addCell(saisir_cellule_tmp("Adresse", font,  12));
            table4.completeRow();
            table4.addCell(saisir_cellule_adresse(fontbold, ns.getProducteur() != null ? ns.getProducteur().getAdresse_fr() : "-", 24));
            table4.setSpacingAfter(12);
        }


        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5 = null;
        if(!ns.getZf_et().equals("XD")){
            table5=new PdfPTable(12);
        }else {
            table5=new PdfPTable(8);
        }

        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table5.setWidthPercentage(100);
        table5.setSpacingBefore(12);
        table5.setSpacingAfter(12);

        //--------------------- Row Title ---------------------
        table5.addCell(saisir_cellule_titre1("منشأة التثمين / التخلص",6));
        table5.addCell(saisir_cellule_titre("Installation de valorisation/élimination",6));

        table5.completeRow();
        //--------------------- completeRow ---------------------
        if(!ns.getZf_et().equals("XD")) {
            table5.addCell(MyCell("إسم الشركة ", font, 2));
            table5.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
        }
        table5.addCell( MyCell("الهاتف",font,2));
        table5.addCell( saisir_cellule_tmp("Téléphone",font,2));
        table5.addCell( MyCell("البريد الإلكتروني",font,2));
        table5.addCell( saisir_cellule_tmp("Email",font,2));
        table5.completeRow();
        if(!ns.getZf_et().equals("XD")) {
            table5.addCell(saisir_cellule_tmp2(fontbold, ns.getEliminateur() != null ? ns.getEliminateur().getNom_fr() : "-", 4));
        }
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getTel():"-",4));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getMail():"-",4));
        table5.completeRow();
        table5.addCell( MyCell("الفاكس",font,2));
        table5.addCell( saisir_cellule_tmp("Fax",font,2));
        table5.addCell( MyCell("جهة الاتصال",font,2));
        table5.addCell( saisir_cellule_tmp("Personne à contacter",font,2));
        table5.addCell( MyCell("العنوان",font,2));
        table5.addCell( saisir_cellule_tmp("Adresse",font,2));
        table5.completeRow();
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getFax():"-",4));
        table5.addCell( saisir_cellule_tmp2(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getContact_fr():"-",4));
        table5.addCell( saisir_cellule_adresse(fontbold,ns.getEliminateur()!=null?ns.getEliminateur().getAdresse_fr():"-",4));
        table5.completeRow();
        table5.setSpacingAfter(12);


        //--------------------- Tableau Installation d’élimination(s) ---------------------
        PdfPTable table5x = new PdfPTable(12);
        table5x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table5x.setWidthPercentage(100);
        table5x.setSpacingBefore(12);

        PdfPTable table6x = new PdfPTable(12);
        table6x.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table6x.setWidthPercentage(100);
        table6x.setSpacingAfter(12);
        if(ns.getZf_et().equals("ZF")) {

            //--------------------- Row Title ---------------------
            table5x.addCell(saisir_cellule_titre1("شهادة التصرف", 6));
            table5x.addCell(saisir_cellule_titre("Certificat d'élimination", 6));

            table5x.completeRow();
            if(ns.getUrl_certicat_elimination()!=null) {
                //--------------------- completeRow ---------------------
                table5x.addCell(MyCell("عدد الطرود", font, 3));
                table5x.addCell(saisir_cellule_tmp("Nombre de colis", font,  3));
                table5x.addCell(MyCell("الكمية المتوقعة", font, 3));
                table5x.addCell(saisir_cellule_tmp("Quantité prévue", font,  3));
                table5x.completeRow();
                table5x.addCell(saisir_cellule_tmp2(fontbold, ns.getNbr_colis() != null ? ns.getNbr_colis() : "-", 6));
                table5x.addCell(saisir_cellule_tmp2(fontbold, ns.getQuantite() != null ? ns.getQuantite() : "-", 6));
                table5x.completeRow();
                table6x.addCell(MyCell("تاريخ التحقق من صحة الشهادة", font, 3));
                table6x.addCell(saisir_cellule_tmp("Date de validation du certificat", font, 3));
                table6x.addCell(MyCell("الكمية",font, 3));
                table6x.addCell(saisir_cellule_tmp("Quantité",font, 3));
                table6x.completeRow();
                for (DetailDocumentMouvement dm : ns.getDocMouvement()) {
                    if (ns.getDocMouvement().size() == 0) {
                        table6x.addCell(saisir_cellule("Aucune Quantité", font, font, "", 12));
                        table6x.completeRow();
                        table6x.setSpacingAfter(12);
                    } else {
                        table6x.addCell(saisir_cellule_tmp2(fontbold, ns.getDateValidation() != null ? dateFormat.format(ns.getDateValidation()) : "", 6));
                        table6x.addCell(saisir_cellule(dm.getQuantite(), font, font, "", 6));
                        table6x.completeRow();
                        table6x.setSpacingAfter(12);
                    }
                }
            }
            else {
                table6x.addCell(saisir_cellule("", font, font, "", 12));
            }
        }

        PdfPTable tablex5 = new PdfPTable(12);
        tablex5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        tablex5.setWidthPercentage(100);
        tablex5.setSpacingBefore(12);
        tablex5.setSpacingAfter(12);
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1) {

            //--------------------- Row Title ---------------------
            tablex5.addCell(saisir_cellule_titre1("تغيير الناقل", 6));
            tablex5.addCell(saisir_cellule_titre("Changement du transporteur", 6));
            tablex5.completeRow();

            if (dt!=null && dt.getEtat() != null ) {
                //--------------------- completeRow ---------------------
                tablex5.addCell(MyCell("إسم الشركة",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Nom de la société", font,2));
                tablex5.addCell(MyCell("الهاتف ",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Télephone ",font, 2));
                tablex5.addCell(MyCell("العنوان",font, 2));
                tablex5.addCell(saisir_cellule_tmp("Adresse", font,2));
                tablex5.completeRow();
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getNom(), font, font, "", 4));
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getTel(), font, font, "", 4));
                tablex5.addCell(saisir_cellule(dt.getTransporteurParam().getAdresse(), font, font, "", 4));
                tablex5.completeRow();

            }
            else {
                PdfPCell tmpX = saisir_cellule("Aucun Transporteur.", fontbold, fontbold, "", 12);
                tmpX.setHorizontalAlignment(Element.ALIGN_CENTER);
                tablex5.addCell(tmpX);
            }
        }



        //--------------------- Tableau Les Pièces ---------------------
        PdfPTable table7 = new PdfPTable(12);
        table7.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table7.setWidthPercentage(100);
        table7.setSpacingBefore(12);
        table7.setSpacingAfter(12);
        table7.addCell(saisir_cellule_titre1("الوثائق المرفقة للطلب",6));
        table7.addCell(saisir_cellule_titre("Pièces accompagnant la demande",6));
        table7.completeRow();

        //table7.addCell(new Paragraph(Chunk.NEWLINE));
        //--------------------- Row Title ---------------------
        int i=1;
        for (ListDocNotif ld: l){
            table7.addCell(saisir_cellule_2(ld.getDocImport().getNom_fr()!=null?ld.getDocImport().getNom_fr():"-",12));
            i++;
            table7.completeRow();
        }

        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table6 = new PdfPTable(12);
        table6.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table6.setWidthPercentage(100);
        table6.setSpacingBefore(12);
        table6.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table6.addCell(saisir_cellule_titre1("وثيقة حركة النفايات",6));
        table6.addCell(saisir_cellule_titre("Document de mouvements des déchets",6));
        table6.completeRow();
        //--------------------- completeRow ---------------------
        table6.addCell( MyCell("الكمية الفعلية",font,2));
        table6.addCell( saisir_cellule_tmp("Quantité réelle",font,2));
        table6.addCell( MyCell("الوحدة",font,2));
        table6.addCell( saisir_cellule_tmp("Unité",font,2));
        table6.addCell( MyCell("عدد الطرود",font,2));
        table6.addCell( saisir_cellule_tmp("Nombre de colis",font,2));
        table6.completeRow();
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite_reel()!=null ? ns.getQuantite_reel() :"",4));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",4));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getNbr_colis()!=null?ns.getNbr_colis():"",4));
        table6.completeRow();
        table6.addCell( MyCell("التاريخ الفعلي للشحن",font,3));
        table6.addCell( saisir_cellule_tmp("Date réelle de l'expédition",font,3));
        table6.addCell( MyCell("المكان الفعلي للتثمين / التخلص",font,3));
        table6.addCell( saisir_cellule_tmp("Lieu effectif de l'élimination/valorisation",font,3));
        table6.completeRow();
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getDate_reel()!=null ? dateFormat.format(ns.getDate_reel()):"",6));
        table6.addCell( saisir_cellule_tmp2(fontbold,ns.getLieux_elimination()!=null?ns.getLieux_elimination().getNom_fr():ns.getLieu(),6));
        table6.completeRow();
        table6.setSpacingAfter(12);



        //--------------------- Tableau Document de mouvements des déchets ---------------------
        PdfPTable table8 = new PdfPTable(4);
        table8.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        table8.setWidthPercentage(100);
        table8.setSpacingBefore(12);
        table8.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table8.addCell(saisir_cellule_titre1("إيصالات الإيداع" ,2));
        table8.addCell(saisir_cellule_titre("Reçu de dépôt" ,2));
        table8.completeRow();

        //table8.addCell(new Paragraph(Chunk.NEWLINE));

        //--------------------- completeRow ---------------------
        //--------------------- completeRow ---------------------

        String username = "";
        String contact = "";
        if(ns.getImportateur()!=null){
            username = ns.getImportateur().getNom_fr();
            contact = ns.getImportateur().getContact_fr();
        }

        String dateTest=convertDate("dd/MM/yyyy",ns.getDateDepot());
        table8.addCell( saisir_cellule2("Date de dépôt de la demande :",font,fontbold,dateTest,4));
        table8.completeRow();
        table8.setSpacingAfter(12);



        PdfPTable table9 = new PdfPTable(4);
        table9.setWidthPercentage(100);
        table9.setSpacingBefore(12);
        table9.setSpacingAfter(12);
        String num_notification = ns.getNum_notification()!=null?ns.getNum_notification():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/downloadRecuDepo/"
                + ns.getId_notification(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);





        /*PdfPCell cell7 = new PdfPCell();
        Paragraph par15= new Paragraph();
        par15.setAlignment(Element.ALIGN_LEFT);
        cell7.setBorder(Rectangle.NO_BORDER);
        par15.setSpacingAfter(5);
        Font blue = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE);
        Chunk chunk1 = new Chunk(url+"/downloadRecuDepo/"+ns.getId_notification(),blue);
        chunk1.setUnderline(1.f, -1);
        par15.add("");
        cell7.addElement(par15);
        cell7.setPadding(5);
        cell7.setColspan(2);

        PdfPCell cell10 = new PdfPCell();
        cell10.setBorder(Rectangle.NO_BORDER);
        cell10.addElement(new Phrase(""));


        table9.addCell(cell10);
        table9.addCell(cell7);
*/
        table9.completeRow();

        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table1);
        document.add(table02);
        document.add(table2);
        document.add(table3);
        document.add(table03);
        document.add(table4);
        document.add(table5);
        document.add(table7);
        document.add(table8);
        document.add(table9);
        // addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static PdfPCell saisir_cellule_adresse(Font font_var,String var, int collspan){

        LineDash solid = new SolidLine();
        LineDash dotted = new DottedLine();
        LineDash dashed = new DashedLine();

        Phrase ph1 = new Phrase(var,font_var);
        Paragraph p1 = new Paragraph();
        p1.setAlignment(Element.ALIGN_CENTER);
        p1.add(ph1);
        PdfPCell cell1 = new PdfPCell(p1);
        cell1.setBorderWidthLeft(0.5f);
        cell1.setBorderWidthRight(0.5f);
        cell1.setBorderWidthTop(0.5f);
        cell1.setBorderWidthBottom(0.5f);
        cell1.setPaddingTop(10);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setCellEvent(new CustomBorder(solid, solid, null, solid));
        cell1.setColspan(collspan);
        cell1.setPaddingLeft(4);
        cell1.setPaddingBottom(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setRunDirection(PdfWriter.RUN_DIRECTION_LTR);
        return cell1;
    }

    public static ByteArrayInputStream generateRecapNumNotification(Notification ns,String url) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document document=new Document(PageSize.A4, 30, 30, 10, 10);
        PdfWriter writer = PdfWriter.getInstance(document,out);
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Setting up the font to be used in Paragraphs
        Font font=new Font(base,10.0f);
        Font font_sm=new Font(base,8.0f);
        Font fontTitre = new Font(base,16.0f,Font.BOLD);
        Font fontbold=new Font(base,10.0f);
        Font fontBox = new Font(base, 20.0f);

        String logo = "/word_header1.png";
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(550

                ,800);

        document.add(image);

        //GLUE CHUNK
        Chunk glue = new Chunk(new VerticalPositionMark());

//        char checked='\u00FE';
//        char unchecked='\u00A8';

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox);
//        Chunk mCube=new Chunk(String.valueOf('\u33A5'),fontBox);

        Chunk oui = new Chunk("Oui : ",font);
        Chunk non = new Chunk("Non : ",font);


        Paragraph headerPar=new Paragraph(10);
        headerPar.setAlignment(Element.ALIGN_CENTER);
        String title_type = "...";
        if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==1){
            title_type = "d'importation des déchets dangereux d'une zone franche";
        }else if(ns.getZf_et().equals("ZF") && ns.getClassification().getId_classification()==2){
            title_type = "d'importation des déchets  non dangereux d'une zone franche";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==1){
            title_type = "d'exportation des déchets dangereux";
        }else if(ns.getZf_et().equals("XD") && ns.getClassification().getId_classification()==2){
            title_type = "d'exportation des déchets non dangereux";
        }
        headerPar.add("Récapitulation de la demande d'autorisation "+title_type);
        headerPar.setFont(fontTitre);
        headerPar.setSpacingBefore(20);

        //--------------------- Table numero de notification ---------------------
        PdfPTable table0 = new PdfPTable(12);
        table0.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        table0.setWidthPercentage(100);
        table0.setSpacingBefore(12);
        table0.setSpacingAfter(12);
        //--------------------- Row Title ---------------------
        table0.addCell(saisir_cellule_titre1("رقم الإخطار",6));
        table0.addCell(saisir_cellule_titre("Numéro de notification",6));
        table0.completeRow();
        //--------------------- completeRow ---------------------
        table0.addCell( MyCell("رقم الإخطار",font,3));
        table0.addCell( saisir_cellule_tmp("Numéro de notification",font,3));
        table0.addCell( MyCell("تصنيف النفايات ",font,3));
        table0.addCell( saisir_cellule_tmp("Classification des déchets",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getNum_notification(),6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getClassification()!=null?ns.getClassification().getNom_fr():"-",6));
        table0.completeRow();
        table0.addCell( MyCell("الرمز ",font,3));
        table0.addCell( saisir_cellule_tmp("Code",font,3));
        table0.addCell( MyCell("الكمية الإجمالية المتوقعة",font,3));
        table0.addCell( saisir_cellule_tmp("Quantité totale prévue",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?RTL_LTR(ns.getCode().getNom_fr()):"-",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getQuantite()!=null?ns.getQuantite():"",6));
        table0.completeRow();
        table0.addCell( MyCell("العملية",font,3));
        table0.addCell( saisir_cellule_tmp("Opération",font,3));
        table0.addCell( MyCell("وحدة",font,3));
        table0.addCell( saisir_cellule_tmp("Unité",font,3));
        table0.completeRow();
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getOperation()!=null?ns.getOperation():"",6));
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getUnite()!=null?ns.getUnite().getNom_fr():"-",6));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(MyCell("المنطقة الحرة", font, 3));
            table0.addCell(saisir_cellule_tmp("Zone Franche", font, 3));
        }else if(ns.getZf_et().equals("ET")) {
            table0.addCell(MyCell("بلد أجنبي", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays étranger", font, 3));
        }
        else {
            table0.addCell(MyCell("بلد التصدير ", font, 3));
            table0.addCell(saisir_cellule_tmp("Pays d'exportation", font, 3));
        }

        table0.addCell( MyCell("نوع النفايات",font,3));
        table0.addCell( saisir_cellule_tmp("Type de déchet",font,3));
        table0.completeRow();
        if(ns.getZf_et().equals("ZF")) {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getZonneFranche() != null ? ns.getZonneFranche().getNom_fr() : "-", 6));
        }else {
            table0.addCell(saisir_cellule_tmp2(fontbold, ns.getPays() != null ? ns.getPays().getNom_fr() : "-", 6));
        }
        table0.addCell( saisir_cellule_tmp2(fontbold,ns.getCode()!=null?ns.getCode().getNom_ar():"-",6));

        //---------------------Tableau Exportateur - Notifiant ----------------------


        PdfPTable table01 = new PdfPTable(12);
        table01.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        if (ns.getZf_et().equals("XD")){
            table01.setWidthPercentage(100);
            table01.setSpacingBefore(12);
            table01.setSpacingAfter(12);

            //--------------------- Row Title ---------------------
            table01.addCell(saisir_cellule_titre1("المصدر - المخطر ",6));
            table01.addCell(saisir_cellule_titre("Exportateur - Notifiant",6));
            table01.completeRow();
            //--------------------- completeRow ---------------------

            /*table01.addCell( MyCell("إسم الشركة",font,2));
            table01.addCell( saisir_cellule_tmp("Nom de la société",font,2));
            table01.addCell( MyCell("البريد الالكتروني",font,2));
            table01.addCell( saisir_cellule_tmp("Email",font,2));
            table01.addCell( MyCell("الهاتف",font,2));
            table01.addCell( saisir_cellule_tmp("Télephone",font,2));
            table01.completeRow();
            table01.addCell(saisir_cellule_tmp2(fontbold,ns.getNom(),4));
            table01.addCell( saisir_cellule_tmp2(fontbold,ns.getCourrier(),4));
            table01.addCell( saisir_cellule_tmp2(fontbold,ns.getTel(),4));
            table01.completeRow();*/
            table01.addCell( MyCell("جهة الاتصال",font,3));
            table01.addCell( saisir_cellule_tmp("Personne à contacter",font,3));
            table01.addCell( MyCell("الجودة",font,3));
            table01.addCell( saisir_cellule_tmp("Qualité",font,3));
            table01.completeRow();
            String representant = ns.getImportateur()!=null?ns.getImportateur().getContact_fr():"-";
            String genre = ns.getImportateur()!=null?ns.getImportateur().getGenre():"-";
            table01.addCell( saisir_cellule_tmp2(fontbold,genre+ " " + representant ,6));
            table01.addCell( saisir_cellule_tmp2(fontbold,ns.getImportateur()!=null?ns.getImportateur().getQualite():"-",6));
            table01.completeRow();
            table01.addCell( MyCell("فاكس",font,3));
            table01.addCell( saisir_cellule_tmp("Fax",font,3));
            table01.addCell( MyCell("الإسم واللقب",font,3));
            table01.addCell( saisir_cellule_tmp("Adresse",font,3));
            table01.completeRow();
            table01.addCell( saisir_cellule_tmp2(fontbold,ns.getImportateur()!=null?ns.getImportateur().getFax():"-",6));
            table01.addCell( saisir_cellule_adresse(fontbold,ns.getImportateur()!=null?ns.getImportateur().getAdresse_fr():"-",6));
            table01.completeRow();

        }

        //--------------------- Tableau Importateur - Destinataire ---------------------
        PdfPTable table1 = new PdfPTable(12);
        table1.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);


        table1.setWidthPercentage(100);
        table1.setSpacingBefore(12);
        table1.setSpacingAfter(12);
        if (ns.getZf_et().equals("ZF")){

            //--------------------- Row Title ---------------------
            table1.addCell(saisir_cellule_titre1("المستورد - المخطر", 6));
            table1.addCell(saisir_cellule_titre("Importateur - Notifiant", 6));

            table1.completeRow();
            //--------------------- completeRow ---------------------

            table1.addCell(MyCell("إسم الشركة", font,2));
            table1.addCell(saisir_cellule_tmp("Nom de la société", font, 2));
            table1.addCell(MyCell("البريد الاكتروني", font, 2));
            table1.addCell(saisir_cellule_tmp("Email", font, 2));
            table1.addCell(MyCell("الهاتف", font,  2));
            table1.addCell(saisir_cellule_tmp("Télephone", font, 2));
            table1.completeRow();
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getNom_fr() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getMail() : "-", 4));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getTel() : "-", 4));
            table1.completeRow();
            table1.addCell(MyCell("الفاكس", font, 3));
            table1.addCell(saisir_cellule_tmp("Fax", font, 3));
            table1.addCell(MyCell("جهة الاتصال", font, 3));
            table1.addCell(saisir_cellule_tmp("Personne à contacter", font, 3));
            table1.completeRow();
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getFax() : "-", 6));
            table1.addCell(saisir_cellule_tmp2(fontbold, ns.getImportateur() != null ? ns.getImportateur().getContact_fr() : "-", 6));
            table1.completeRow();
            table1.addCell(MyCell("العنوان", font,  6));
            table1.addCell(saisir_cellule_tmp("Adresse", font,  6));
            table1.completeRow();
            table1.addCell(saisir_cellule_adresse(fontbold, ns.getImportateur() != null ? ns.getImportateur().getAdresse_fr() : "-", 12));



        }

        String num_notification = ns.getNum_notification()!=null?ns.getNum_notification():"";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(url+"/api/generate_recap_Num/"
                + ns.getId_notification(), 300,
                300,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);

        document.add(headerPar);
        document.add(table0);
        document.add(table01);
        document.add(table1);
        addFooter(writer,codeQrImage);
        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream generateDocumentNonFavZF(DocumentImportationDechet d,Notification nt,String urlRest) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Document document=new Document(PageSize.A4, 30, 30, 30, 0);
        PdfWriter writer =PdfWriter.getInstance(document,out);
        writer.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        document.open();

        BaseFont base = null;
        try {
            base = BaseFont.createFont("/static/assets_admin/fonts/arial.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        BaseFont base2 = null;
        try {
            base2 = BaseFont.createFont("/static/assets_admin/fonts/WingdingsRegular.ttf", BaseFont.IDENTITY_H, false);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Font font=new Font(Font.FontFamily.TIMES_ROMAN,9.0f);
        Font fontbold=new Font(base,13,Font.BOLD);
        Font fontBox = new Font(base, 10f);
        Font fontBox2 = new Font(base2, 10f);

        Chunk checkedChunk=new Chunk(String.valueOf('\u00FE'),fontBox2);
        Chunk uncheckedChunk=new Chunk(String.valueOf('\u00A8'),fontBox2);

        String logo =d.getLogo();
        Image image = Image.getInstance(GeneratePDFDocuments.class.getResource(logo));
        image.scaleToFit(560,500);
        document.add(image);

        Paragraph par1= new Paragraph();
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(""));
        par1.setSpacingAfter(10);
        par1.add(Chunk.NEWLINE);
        document.add(par1);

        PdfPTable table5 = new PdfPTable(2);
        table5.setWidthPercentage(100);
        table5.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

        PdfPCell cell = new PdfPCell();
        Paragraph par2= new Paragraph();
        if(nt.getClassification().getId_classification()==2) {
            par2.add(new Phrase(d.getTitle(),fontbold));
        }
        if(nt.getClassification().getId_classification()==1) {
            par2.add(new Phrase(d.getTitle2(),fontbold));
        }
        par2.setAlignment(Element.ALIGN_CENTER);
        par2.setSpacingAfter(5);
        cell.setColspan(2);
        cell.addElement(par2);
        cell.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell.setPadding(15);

        PdfPCell cell2 = new PdfPCell();
        Paragraph par3= new Paragraph();
        par3.setSpacingAfter(5);
        cell2.setColspan(2);
        par3.add(new Phrase(d.getP1(),fontbold));
        par3.setAlignment(Element.ALIGN_CENTER);
        cell2.addElement(par3);
        cell2.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell2.setPadding(5);

        PdfPCell cell3 = new PdfPCell();
        Paragraph par4= new Paragraph();
        String nomFr = nt.getImportateur().getNom_fr() != null ? nt.getImportateur().getNom_fr() : "";
        String Adresse = nt.getImportateur().getAdresse_fr() != null ? nt.getImportateur().getAdresse_fr() : "";
        String Tel = nt.getImportateur().getFax()!= null ? nt.getImportateur().getFax() + " / " + nt.getImportateur().getTel() : "";
        String Mail = nt.getImportateur().getMail() != null ? nt.getImportateur().getMail() : "";

        cell3.setColspan(2);
        par4.add(new Phrase(d.getNomSociete()+":  "+nomFr,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getAdresse()+":  "+Adresse,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getTel()+":  "+Tel,fontBox));
        par4.add(Chunk.NEWLINE);
        par4.add(new Phrase(d.getEmail()+":  "+Mail,fontBox));
        par4.setAlignment(Element.ALIGN_LEFT);
        cell3.addElement(par4);
        cell3.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell3.setPadding(5);

        PdfPCell cell4 = new PdfPCell();
        Paragraph par5= new Paragraph();
        par5.setSpacingAfter(5);
        cell4.setColspan(2);
        par5.add(new Phrase(d.getP3(),fontbold));
        par5.setAlignment(Element.ALIGN_CENTER);
        cell4.addElement(par5);
        cell4.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        cell4.setPadding(5);

        PdfPCell cell5 = new PdfPCell();
        Paragraph par6= new Paragraph();
        par6.setSpacingAfter(5);
        cell5.setColspan(2);
        String NomAr = nt.getCode().getNom_ar() != null ? nt.getCode().getNom_ar() : "";
        String txt = nt.getProducteur_text()!= null ? nt.getProducteur_text(): "";
        String Nom_FR = nt.getCode().getNom_fr()!= null ? nt.getCode().getNom_fr() : "";
        String qte = nt.getQuantite()!= null ? nt.getQuantite():" " ;
        String unite =nt.getUnite().getNom_ar()!= null ? nt.getUnite().getNom_ar(): "";

        //StringBuilder sb=new StringBuilder(Nom_FR);
        //sb.reverse();
        par6.add(new Phrase(d.getNumero()+":  "+nt.getNum_notification(),fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getType()+":  "+ NomAr,fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getSource()+":  "+txt,fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getCode()+":  "+ RTL_LTR(Nom_FR),fontBox));
        par6.add(Chunk.NEWLINE);
        par6.add(new Phrase(d.getQuantite()+":  "+qte+" "+unite,fontBox));
        par6.setAlignment(Element.ALIGN_LEFT);
        cell5.addElement(par6);
        cell5.setPadding(5);

        PdfPCell cell6 = new PdfPCell();
        cell6.setColspan(2);
        cell6.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        Paragraph par7= new Paragraph();
        par7.setSpacingAfter(5);
        cell6.setColspan(2);
        par7.add(new Phrase(d.getP6(),fontbold));
        par7.setAlignment(Element.ALIGN_CENTER);
        cell6.addElement(par7);
        cell6.setPadding(5);

        PdfPCell cell7 = new PdfPCell();
        Paragraph par8= new Paragraph();
        par8.setSpacingAfter(5);
        cell7.setColspan(2);
        if(nt.getClassification().getId_classification()==2) {
            String tr=nt.getTransporteur_etranger().size()> 0 ? nt.getTransporteur_etranger().get(0).getRaison_social(): "" ;
            String pt =nt.getTransporteur_etranger().size()>0 ?nt.getTransporteur_etranger().get(0).getNum_matricule() : "" ;
            par8.add(new Phrase(d.getNomtr()+":  "+tr,fontBox));
            par8.add(Chunk.NEWLINE);
            par8.add(new Phrase(d.getPattente()+" test:  "+(pt==null?"":pt),fontBox));
        }
        if(nt.getClassification().getId_classification()==1) {
            String tr=nt.getTransporteur().size()> 0 ? nt.getTransporteur().get(0).getNom(): "" ;
            String pt =nt.getTransporteur().size()>0 ? nt.getTransporteur().get(0).getNumero_autorisation() : "" ;
            par8.add(new Phrase(d.getNomtr()+":  "+tr,fontBox));
            par8.add(Chunk.NEWLINE);
            par8.add(new Phrase(d.getPattente()+":  "+(pt==null?"":pt),fontBox));
        }
        par8.add(Chunk.NEWLINE);
        par8.setAlignment(Element.ALIGN_LEFT);
        cell7.addElement(par8);
        cell7.setPadding(5);

        PdfPCell cell8 = new PdfPCell();
        Paragraph par9= new Paragraph();
        par9.setSpacingAfter(5);
        cell8.setColspan(2);
        par9.add(new Phrase(d.getP8(),fontbold));
        par9.setAlignment(Element.ALIGN_CENTER);
        cell8.addElement(par9);
        cell8.setPadding(5);

        String nom=nt.getEliminateur().getNom_fr() == null ? "" : nt.getEliminateur().getNom_fr();
        String adresse=nt.getEliminateur().getAdresse_fr() == null ? "" : nt.getEliminateur().getAdresse_fr();
        String tel=nt.getEliminateur().getTel() == null ? "" : nt.getEliminateur().getTel();
        String pattente=nt.getEliminateur().getPattente() == null ? "" : nt.getEliminateur().getPattente();

        PdfPCell cell9a = new PdfPCell();
        Paragraph par10a= new Paragraph();
        par10a.setSpacingAfter(5);
        par10a.add(new Phrase(d.getNom()+":  "+nom,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getPattente()+":  "+pattente,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getAdresse()+":  "+adresse,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getTel()+": "+tel,fontBox));
        par10a.add(Chunk.NEWLINE);
        par10a.add(new Phrase(d.getType()+":  ",fontBox));
        par10a.add(new Phrase(d.getTatmin()+"  ",fontBox));
        par10a.add(new Phrase(nt.getOperation().equalsIgnoreCase("valorisation")?checkedChunk:uncheckedChunk));
        par10a.add(Chunk.TABBING);
        par10a.add(new Phrase(d.getMo3alaja()+"  ",fontBox));
        par10a.add(new Phrase(nt.getOperation().equalsIgnoreCase("traitement")?checkedChunk:uncheckedChunk));
        par10a.add(Chunk.NEWLINE);
        par10a.setAlignment(Element.ALIGN_LEFT);
        cell9a.addElement(par10a);
        cell9a.setColspan(2);
        cell9a.setPadding(5);


        PdfPCell cell010 = new PdfPCell();
        cell010.setColspan(2);
        cell010.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        Paragraph par11= new Paragraph();
        par11.setSpacingAfter(5);
        String comment=nt.getCommentaire() == null ? "" : nt.getCommentaire();
        par11.add(new Phrase(nt.getStatut().getId_statut_projet()!=40?d.getStAccepte()+" "+d.getNumero()+"  "+nt.getNum_notification()+"  لشركة  " +nomFr:d.getStRefuse(),fontBox));
        par11.add(Chunk.NEWLINE);
        par11.add(new Phrase(nt.getStatut().getId_statut_projet()==40?d.getComment()+":  "+comment:"",fontBox));
        par11.add(Chunk.NEWLINE);
        if(nt.getStatut().getId_statut_projet()!=40) {
            par11.add(new Phrase(d.getTemps() + ":                                    ", fontBox));
            par11.add(new Phrase("  " + d.getIla() + ":                                 ", fontBox));
        }
        par11.setAlignment(Element.ALIGN_LEFT);
        par11.add(Chunk.NEWLINE);
        cell010.addElement(par11);
        cell010.setPadding(5);
        par11.add(Chunk.NEWLINE);
        Paragraph par13= new Paragraph();
        par13.add(new Phrase(d.getSigne(),fontbold));
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        par13.add(Chunk.NEWLINE);
        cell010.setPaddingLeft(50);
        par13.setAlignment(Element.ALIGN_CENTER);
        cell010.addElement(par13);

        String num_notification = nt.getNum_notification() != null ? nt.getNum_notification() : "";
        BarcodeQRCode barcodeQRCode = new BarcodeQRCode(urlRest+"/DownloadFile/"+nt.getId_notification()+"/"+nt.getZf_et()+"/"+1,
                200, 200,null);
        Image codeQrImage = barcodeQRCode.getImage();
        codeQrImage.scaleAbsolute(100, 100);



        table5.addCell(cell);

        table5.addCell(cell2);

        table5.addCell(cell3);

        table5.addCell(cell4);

        table5.addCell(cell5);

        table5.addCell(cell6);

        table5.addCell(cell7);

        table5.addCell(cell8);

        table5.addCell(cell9a);


        table5.addCell(cell010);

        document.add(table5);

        addFooter(writer,codeQrImage);



        document.close();

        return new ByteArrayInputStream(out.toByteArray());
    }

}


