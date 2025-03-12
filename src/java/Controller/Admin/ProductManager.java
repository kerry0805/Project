package Controller.Admin;

import DAO.productDAO;
import Entity.Category;
import Entity.Color;
import Entity.Product;
import Entity.Memory;
import Entity.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProductManager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                productDAO dao = new productDAO();
                
                if (action == null || action.isEmpty()) {
                    request.setAttribute("CategoryData", dao.getCategory());
                    request.setAttribute("ProductData", dao.getProduct());
                    request.setAttribute("SizeData", dao.getSize());
                    request.setAttribute("ColorData", dao.getColor());
                    request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
                    return;
                }

                if (action.equalsIgnoreCase("insert")) {
                    request.setAttribute("CategoryData", dao.getCategory());
                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);
                    return;
                }

                if (action.equalsIgnoreCase("insertcategory")) {
                    String name = request.getParameter("name");
                    if (dao.getCategoryByName(name) != null) {
                        request.setAttribute("error", name + " already exists");
                        request.getRequestDispatcher("admin/productinsert.jsp").forward(request, response);
                        return;
                    } else {
                        dao.insertCategory(name);
                        response.sendRedirect("productmanager?action=insert");
                        return;
                    }
                }

                if (action.equalsIgnoreCase("insertproduct")) {
                    Product product = new Product();
                    product.setCate(new Category(Integer.parseInt(request.getParameter("category_id"))));
                    product.setProduct_id(request.getParameter("product_id"));
                    product.setProduct_name(request.getParameter("product_name"));
                    product.setProduct_price(Float.parseFloat(request.getParameter("price")));
                    product.setProduct_describe(request.getParameter("describe"));
                    product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                    product.setImg("images/" + request.getParameter("product_img"));
                    
                    List<Memory> sizes = new ArrayList<>();
                    for (String s : request.getParameter("size").split(",")) {
                        sizes.add(new Memory(product.getProduct_id(), s.trim()));
                    }
                    product.setSize(sizes);
                    
                    List<Color> colors = new ArrayList<>();
                    for (String c : request.getParameter("color").split(",")) {
                        colors.add(new Color(product.getProduct_id(), c.trim()));
                    }
                    product.setColor(colors);
                    
                    dao.insertProduct(product);
                    response.sendRedirect("productmanager?action=insert");
                    return;
                }

                if (action.equalsIgnoreCase("deleteproduct")) {
                    dao.ProductDelete(request.getParameter("product_id"));
                    response.sendRedirect("productmanager");
                    return;
                }

                if (action.equalsIgnoreCase("updateproduct")) {
                    Product product = new Product();
                    product.setCate(new Category(Integer.parseInt(request.getParameter("category_id"))));
                    product.setProduct_id(request.getParameter("product_id"));
                    product.setProduct_name(request.getParameter("product_name"));
                    product.setProduct_price(Float.parseFloat(request.getParameter("product_price")));
                    product.setProduct_describe(request.getParameter("product_describe"));
                    product.setQuantity(Integer.parseInt(request.getParameter("product_quantity")));
                    product.setImg("images/" + request.getParameter("product_img"));
                    
                    List<Memory> sizes = new ArrayList<>();
                    for (String s : request.getParameter("product_size").split(",")) {
                        sizes.add(new Memory(product.getProduct_id(), s.trim()));
                    }
                    product.setSize(sizes);
                    
                    List<Color> colors = new ArrayList<>();
                    for (String c : request.getParameter("product_color").split(",")) {
                        colors.add(new Color(product.getProduct_id(), c.trim()));
                    }
                    product.setColor(colors);
                    
                    dao.insertProduct(product);
                    response.sendRedirect("productmanager");
                    return;
                }
            } else {
                response.sendRedirect("user?action=login");
                return;
            }
        } catch (Exception e) {
            if (!response.isCommitted()) {
                response.sendRedirect("404.jsp");
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
