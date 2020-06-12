class ApplicationController < ActionController::Base
    include Jpmobile::ViewSelector
    include SessionsHelper
    
    protect_from_forgery with: :exception
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        root_path   #ログイン後
    end
    def after_sign_out_path_for(resource)
        root_path   #ログアウト後
    end
    def after_sign_up_path_for(resource)
        root_path   #サインアップ後　多分いらない
    end

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :theme])
    end
    
    #カラーテーマ
    $melon = {'clr_main'=>"#72BF96", 'clr_sub'=> "#F9F9D1", 'clr_list_i'=> "#96CCB2",'clr_list_ii'=> "#98B59C",  'clr_font'=> "#592C2C",'clr_point'=>"#E57E7E"}
    $sodapop = {'clr_main'=> "#46b1c9", 'clr_sub'=> "#E2F2DA", 'clr_list_i'=> "#8DCDD3", 'clr_list_ii'=> "#9fb7b9", 'clr_font'=> "#717570",'clr_point'=>"#E55750"}
    $mono = {'clr_main'=> "#262626", 'clr_sub'=> "#ebebeb", 'clr_list_i'=> "#7f7f7f", 'clr_list_ii'=> "#696969", 'clr_font'=> "#3f3f3f" ,'clr_point'=>"#A7A893"}
    $cake = {'clr_main'=> "#F2918A", 'clr_sub'=> "#FAFAD7", 'clr_list_i'=> "#F5BBB6",'clr_list_ii'=> "#E59D99",  'clr_font'=> "#331f1d" ,'clr_point'=>"#47B28E"}
end