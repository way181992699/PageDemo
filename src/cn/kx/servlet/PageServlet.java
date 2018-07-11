package cn.kx.servlet;

import cn.kx.poji.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Servlet", urlPatterns = "/page")
public class PageServlet extends HttpServlet {


    private int currentPage = 0;
    private int pageSize = 10;
    private int total;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
        String currentPageStr = request.getParameter("CurrentPage");
        String pageSizeStr = request.getParameter("PageSize");
        if (currentPageStr != null && !"".equals(currentPageStr)) {
            currentPage = Integer.parseInt(currentPageStr.trim());
        }
        if (pageSizeStr != null && !"".equals(pageSizeStr)) {

            pageSize = Integer.parseInt(pageSizeStr.trim());
        }

        List<User> list = new ArrayList<>();
        for (int i = 1; i <= 302; i++) {
            list.add(new User(i, "July" + i, "ÃÜÂë" + i));

        }
        int endIndex = (currentPage + 1) * pageSize > list.size() ? list.size() : (currentPage + 1) * pageSize;
        List<User> listsub = list.subList(currentPage * pageSize, endIndex);

        total = (list.size() - 1) / pageSize;
        int size = list.size();
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("list",listsub);
        request.setAttribute("total",total);
        request.setAttribute("pageSize",pageSize);
        request.setAttribute("size",size);
        request.getRequestDispatcher("page.jsp").forward(request,response);

    }
}
