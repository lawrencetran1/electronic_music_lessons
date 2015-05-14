require "rails_helper"

    describe StaticPagesController, :type => :controller do

        #Calling the methods - not the routes.


    it "should get the Tutorial app's index page" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
     end

     it "renders the Tutorial app's index template" do
      get :index
      expect(response).to render_template(:index)
    end



    it "should get the About static page" do
        get :about
        expect(response).to be_success
        expect(response).to have_http_status(200)
     end

     it "renders the About page template" do
      get :about
      expect(response).to render_template(:about)
    end



    it "should get the FAQ static page" do
        get :faq
        expect(response).to be_success
        expect(response).to have_http_status(200)
     end

     it "renders the FAQ page template" do
      get :faq
      expect(response).to render_template(:faq)
    end



    it "should get the Contact static page" do
        get :contact
        expect(response).to be_success
        expect(response).to have_http_status(200)
     end

     it "renders the contact page template" do
      get :contact
      expect(response).to render_template(:contact)
    end


 end