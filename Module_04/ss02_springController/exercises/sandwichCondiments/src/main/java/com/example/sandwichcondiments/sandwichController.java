package com.example.sandwichcondiments;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/save")
public class sandwichController {

    @GetMapping()
    public String selectSpice(){
        return "spice";
    }
    @PostMapping()
    public String afterSelect(@RequestParam(defaultValue = "") String Tomato,
                              @RequestParam(defaultValue = "") String Lettuce,
                              @RequestParam(defaultValue = "") String Mustard,
                              @RequestParam(defaultValue = "") String Sprouts,
                              Model model){
        model.addAttribute("spice", Tomato+" "+Lettuce+" "+Mustard+" "+Sprouts);
        if(Tomato.equals("") && Lettuce.equals("") && Mustard.equals("") && Sprouts.equals("")){
            model.addAttribute("spice","No Spices!");
        }
        return "spice";
    }

}
