module Tolk
  class LocalesController < Tolk::ApplicationController
    before_filter :find_locale, :only => [:show, :all, :update, :updated]
    before_filter :ensure_no_primary_locale, :only => [:all, :update, :show, :updated]

    def index
      @locales = Tolk::Locale.secondary_locales
    end
  
    def show
      respond_to do |format|
        format.html do
          @locales = Tolk::Locale.all
          @phrases = @locale.phrases_without_translation(params[:page])
        end
        format.atom { @phrases = @locale.phrases_without_translation(params[:page], :per_page => 50) }
        format.yaml { render :text => @locale.to_hash.ya2yaml(:syck_compatible => true) }
      end
    end

    def update
      @locale.translations_attributes = params[:translations]
      @locale.save
      redirect_to request.referrer
    end

    def all
      @phrases = @locale.phrases_with_translation(params[:page])
    end

    def updated
      @phrases = @locale.phrases_with_updated_translation(params[:page])
      render :all
    end

    def create
      Tolk::Locale.create!(locale_params)
      redirect_to :action => :index
    end

    private

    def find_locale
      @locale = Tolk::Locale.find_by_name!(params[:id])
    end

    def translation_params
      params.require(:translation).permit(:phrase_id, :locale_id, :text, :previous_text, :primary_updated, :locale, :phrase)
    end

    def locale_params
      params.require(:tolk_locale).permit(:name)
    end
  end
end
