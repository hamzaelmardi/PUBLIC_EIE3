//package com.EIE.demo.dataService;
//
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
//import java.util.Random;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.EIE.demo.exception.FileStorageException;
//import com.EIE.demo.exception.MyFileNotFoundException;
//import com.EIE.demo.property.FileStorageProperties;
//import org.springframework.util.StringUtils;
//import java.io.IOException;
//import java.net.MalformedURLException;
//import org.springframework.core.io.Resource;
//import org.springframework.core.io.UrlResource;
//
//import java.net.URISyntaxException;
//
//@Service
//public class FileStorageService {
//
//    private final Path fileStorageLocation;
//
//    @Autowired
//    public FileStorageService(FileStorageProperties fileStorageProperties) throws IOException, URISyntaxException {
////    	URI chemain = new ClassPathResource("/static/assets/myFile").getURI();
//
//        this.fileStorageLocation = Paths.get(fileStorageProperties.getUploadDir())
//                .toAbsolutePath().normalize();
//       
//        try {
//            Files.createDirectories(this.fileStorageLocation);
//        } catch (Exception ex) {
//            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.", ex);
//        }
//    }
//
//    public String storeFile(MultipartFile file) {
//        // Normalize file name
//        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
//        Random ran = new Random();
//		String exte=fileName.substring(fileName.lastIndexOf('.'));
//		int x = ran.nextInt(1000) + 500;
//
//        try {
//            // Check if the file's name contains invalid characters
//            if(fileName.contains("..")) {
//                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + "file"+x+exte);
//            }
//
//            // Copy file to the target location (Replacing existing file with the same name)
//            Path targetLocation = this.fileStorageLocation.resolve("file"+x+exte);
//            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
//
//            return "file"+x+exte;
//        } catch (IOException ex) {
//            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
//        }
//    }
//
//    public Resource loadFileAsResource(String fileName) {
//        try {
//            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
//            Resource resource = new UrlResource(filePath.toUri());
//            if(resource.exists()) {
//                return resource;
//            } else {
//                throw new MyFileNotFoundException("File not found " + fileName);
//            }
//        } catch (MalformedURLException ex) {
//            throw new MyFileNotFoundException("File not found " + fileName, ex);
//        }
//    }
//}
