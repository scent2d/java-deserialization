package test;

import java.io.*;  
import java.sql.*;  
import java.util.*;
import javax.servlet.ServletException;  
import javax.servlet.http.*; 
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.SafeConstructor;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import java.util.HashMap;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.FileNotFoundException;

public class Secure extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    private Map<String, Object> processFiles(String filePath) throws FileNotFoundException{        
        InputStream inputStream = new FileInputStream(new File(filePath));
        Map<String, Object> data = new HashMap<>();
        try {
            // 입력 값 검증 존재 -> SafeConstructor 객체(org.yaml.snakeyaml.constructor.SafeConstructor) 활용
            Yaml yaml = new Yaml(new SafeConstructor());
            data = yaml.load(inputStream);
            return data;                       
        } catch (Exception e1) {
            e1.printStackTrace();            
        }  
        return data;              
    }
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {           
        request.getRequestDispatcher("secure.jsp").forward(request, response);
    }
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
         String filePath = "";       
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        File uploadedFile = new File(name);
                        filePath = uploadedFile.getAbsolutePath();
                        item.write(uploadedFile);
                    }
                }
                if (filePath != ""){
                    Map<String, Object> data = processFiles(filePath);        
                    request.setAttribute("users", data);
                }
                request.getRequestDispatcher("secure.jsp").forward(request, response);
            } catch (Exception e1) {
                e1.printStackTrace();            
            }   
        }        
        request.getRequestDispatcher("secure.jsp").forward(request, response);
    }
}
