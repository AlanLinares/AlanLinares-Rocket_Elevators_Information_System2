class LeadsController < ApplicationController

def create
    lead = Lead.create!(

        full_name: params[:full_name],
        company_name: params[:company_name],
        email: params[:email],
        phone: params[:phone_number],
        project_name: params[:project_name],
        project_description: params[:project_description],
        department_of_elevators: params[:department_of_elevators]
        message: params[:message],
        attachment: params[:attachment],
        date_of_contact_request: DateTime.now,
   
    )

    redirect_to(/index)


end
end