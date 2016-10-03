package com.examples;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.*;

/**
 * Created by tri.bui on 9/12/16.
 */
@RestController
@Configuration
public class HelloController {
    @RequestMapping(value = "/hello/{name}", method = RequestMethod.GET)
    public @ResponseBody String sayHello(@PathVariable(value="name") String name) {
        return "Hello, hello V2 " + name;
    }
}

