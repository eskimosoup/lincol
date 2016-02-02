require "rails_helper"

describe Optimadmin::GeneralDownloadsController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when General download is valid" do
      it "redirects to index on normal save" do
        general_download = stub_valid_general_download

        post :create, commit: "Save", general_download: general_download.attributes

        expect(response).to redirect_to(general_downloads_path)
        expect(flash[:notice]).to eq("General download was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        general_download = stub_valid_general_download

        post :create, commit: "Save and continue editing", general_download: general_download.attributes

        expect(response).to redirect_to(edit_general_download_path(general_download))
        expect(flash[:notice]).to eq("General download was successfully created.")
      end
    end

    context "when General download is invalid" do
      it "renders the edit template" do
        general_download = stub_invalid_general_download

        post :create, commit: "Save", general_download: general_download.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when General download is valid" do
      it "redirects to index on normal save" do
        general_download = stub_valid_general_download

        patch :update, id: general_download.id, commit: "Save", general_download: general_download.attributes

        expect(response).to redirect_to(general_downloads_path)
        expect(flash[:notice]).to eq("General download was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        general_download = stub_valid_general_download

        patch :update, id: general_download.id, commit: "Save and continue editing", general_download: general_download.attributes

        expect(response).to redirect_to(edit_general_download_path(general_download))
        expect(flash[:notice]).to eq("General download was successfully updated.")
      end
    end

    context "when General download is invalid" do
      it "renders the edit template" do
        general_download = stub_invalid_general_download

        patch :update, id: general_download.id, commit: "Save", general_download: general_download.attributes

        expect(response).to render_template(:edit)
      end
    end
  end
  
  def stub_valid_general_download
    general_download = build_stubbed(:general_download)
    allow(AdditionalContent).to receive(:new).and_return(general_download)
    allow(general_download).to receive(:save).and_return(true)
    allow(AdditionalContent).to receive(:find).and_return(general_download)
    allow(general_download).to receive(:update).and_return(true)
    general_download
  end

  def stub_invalid_general_download
    general_download = build_stubbed(:general_download)
    allow(AdditionalContent).to receive(:new).and_return(general_download)
    allow(general_download).to receive(:save).and_return(false)
    allow(AdditionalContent).to receive(:find).and_return(general_download)
    allow(general_download).to receive(:update).and_return(false)
    general_download
  end
end

