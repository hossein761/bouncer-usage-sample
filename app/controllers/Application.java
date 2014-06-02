package controllers;

import annotations.BouncerSecuredAction;
import play.*;
import play.mvc.*;

import views.html.*;

@BouncerSecuredAction
public class Application extends Controller {

    @BouncerSecuredAction
    public static Result index() {
        System.out.println("here!!!!!!!!!!!!");
        return ok(index.render("Your new application is ready."));
    }

}
