package web;

import domain.Order;
import domain.User;
import exeptions.NoSuchCupcakeException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RemoveFromOrder extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        int cupcakeId = Integer.parseInt(request.getParameter("cupcakeid"));

        try {
            api.getOrderFacade().removeCupcakeFromOrder(user.getId(), cupcakeId);
        } catch (NoSuchCupcakeException e) {
            e.printStackTrace();
        }

        Order order = api.getOrderFacade().getOrderById(user.getId());
        request.setAttribute("order", order);
        return "Kurv";
    }
}
