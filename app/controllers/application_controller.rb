class ApplicationController < ActionController::Base
    include SessionsHelper
    private
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    $melon = {'clr_main'=>"#72BF96", 'clr_sub'=> "#F9F9D1", 'clr_list_i'=> "#96CCB2",'clr_list_ii'=> "#98B59C",  'clr_font'=> "#592C2C",'clr_point'=>"#E57E7E"}
    $sodapop = {'clr_main'=> "#46b1c9", 'clr_sub'=> "#E2F2DA", 'clr_list_i'=> "#8DCDD3", 'clr_list_ii'=> "#9fb7b9", 'clr_font'=> "#717570",'clr_point'=>"#E55750"}
    $mono = {'clr_main'=> "#262626", 'clr_sub'=> "#ebebeb", 'clr_list_i'=> "#7f7f7f", 'clr_list_ii'=> "#696969", 'clr_font'=> "#3f3f3f" ,'clr_point'=>"#A7A893"}
    $cake = {'clr_main'=> "#F2918A", 'clr_sub'=> "#FAFAD7", 'clr_list_i'=> "#F5BBB6",'clr_list_ii'=> "#E59D99",  'clr_font'=> "#331f1d" ,'clr_point'=>"#47B28E"}
      
end
