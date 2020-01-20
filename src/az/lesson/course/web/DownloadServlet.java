package az.lesson.course.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "DownloadServlet",urlPatterns = "/ds")
public class DownloadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //CourseDao courseDao = new CourseDaoImpl();
        //CourseService courseService = new CourseServiceImpl(courseDao);

        try {
            //Long studentId=101;
            // Student student = courseService.getStudentById(studentId);
            //System.out.println(student.getImageFullPath());
            String filePath = request.getParameter("fileName");
            //String filePath=student.getImageFullPath();

            File downloadFile = new File(filePath);
            FileInputStream inputStream = new FileInputStream(downloadFile);

            ServletContext context = getServletContext();

            //gets MIME type of the file
            String mimeType = context.getMimeType(filePath);
            if (mimeType == null) {
                //set to binary type if MIME mapping not found
                mimeType = "application/octet-stream";
            }
            System.out.println("MIME type :" + mimeType);

            //modifies response
            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());

            //forces download
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; fileName=\"%s\"", downloadFile.getName());
            response.setHeader(headerKey, headerValue);

            //obtains response's output stream
            OutputStream outputStream= response.getOutputStream();

            byte [] buffer = new byte[4096];
            int bytesRead= -1;

            //bayt bayt oxuyur
            while ((bytesRead=inputStream.read(buffer))!=-1){
                outputStream.write(buffer, 0 , bytesRead);
            }
            inputStream.close();
            outputStream.close();

        } catch (Exception ex) {

        }

    }


}
