package controllers;

import annotations.BouncerSecuredAction;
import play.*;
import play.mvc.*;

import views.html.*;

public class Application extends Controller {

	public static Result login() {
		return ok(login.render());
	}

    @BouncerSecuredAction
    public static Result index() {
        System.out.println("here!!!!!!!!!!!!");
        return ok(index.render("Your new application is ready."));
    }

}
