import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AreaCheckServlet", value = "/area_check")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double x = 0;
        double y = 0;
        double r = 0;

        try {
            x = Double.parseDouble(request.getParameter("x").replace(",", "."));
            y = Double.parseDouble(request.getParameter("y").replace(",", "."));
            r = Double.parseDouble(request.getParameter("r").replace(",", "."));
        }catch (NullPointerException | NumberFormatException ig){
            response.sendRedirect("index.jsp");
        }
        boolean result = hitFun(x, y, r);
        System.out.println(result);
        request.setAttribute("result", result);
    }

    private boolean hitFun(double x, double y, double r) {
        if (x <= 0 && y <= 0 && (2 * x + 2 * y) <= r){
            return true;
        } else if (x <= 0 && y >= 0 && (x*x/2 + y*y/2) >= r ){
            return true;
        } else if (x <= 0 && y >= 0 && x >= r/2 && y <= -r){
            return true;
        } else if (x == 0 && y == 0){
            return true;
        }
        return false;
    }

}
