namespace :migrations do

    desc "catalogue_states"
    task :catalogue_states :environment do
        catalogues = [
            {var_name: "mex_state", name: "Estado de la República", name: "Aguascalientes"},
            {var_name: "mex_state", name: "Estado de la República", name: "Baja California"},
            {var_name: "mex_state", name: "Estado de la República", name: "Baja California Sur"},
            {var_name: "mex_state", name: "Estado de la República", name: "Campeche"},
            {var_name: "mex_state", name: "Estado de la República", name: "Coahuila"},
            {var_name: "mex_state", name: "Estado de la República", name: "Colima"},
            {var_name: "mex_state", name: "Estado de la República", name: "Chiapas"},
            {var_name: "mex_state", name: "Estado de la República", name: "Chihuahua"},
            {var_name: "mex_state", name: "Estado de la República", name: "Ciudad de México"},
            {var_name: "mex_state", name: "Estado de la República", name: "Durango"},
            {var_name: "mex_state", name: "Estado de la República", name: "Guanajuato"},
            {var_name: "mex_state", name: "Estado de la República", name: "Guerrero"},
            {var_name: "mex_state", name: "Estado de la República", name: "Hidalgo"},
            {var_name: "mex_state", name: "Estado de la República", name: "Jalisco"},
            {var_name: "mex_state", name: "Estado de la República", name: "Estado de México"},
            {var_name: "mex_state", name: "Estado de la República", name: "Michoacán"},
            {var_name: "mex_state", name: "Estado de la República", name: "Morelos"},
            {var_name: "mex_state", name: "Estado de la República", name: "Nayarit"},
            {var_name: "mex_state", name: "Estado de la República", name: "Nuevo León"},
            {var_name: "mex_state", name: "Estado de la República", name: "Oaxaca"},
            {var_name: "mex_state", name: "Estado de la República", name: "Puebla"},
            {var_name: "mex_state", name: "Estado de la República", name: "Querétaro"},
            {var_name: "mex_state", name: "Estado de la República", name: "Quintana Roo"},
            {var_name: "mex_state", name: "Estado de la República", name: "San Luis Potosí"},
            {var_name: "mex_state", name: "Estado de la República", name: "Sinaloa"},
            {var_name: "mex_state", name: "Estado de la República", name: "Sonora"},
            {var_name: "mex_state", name: "Estado de la República", name: "Tabasco"},
            {var_name: "mex_state", name: "Estado de la República", name: "Tamaulipas"},
            {var_name: "mex_state", name: "Estado de la República", name: "Tlaxcala"},
            {var_name: "mex_state", name: "Estado de la República", name: "Veracruz"},
            {var_name: "mex_state", name: "Estado de la República", name: "Yucatán"},
            {var_name: "mex_state", name: "Estado de la República", name: "Zacatecas"}
        ]
        
        State.create!(catalogues);
end