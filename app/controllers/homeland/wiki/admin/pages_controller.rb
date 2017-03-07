module Homeland::Wiki::Admin
  class PagesController < ::Admin::ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
      @pages = Page.unscoped.order(id: :desc).page(params[:page])
    end

    def edit
    end

    def update
      @page.title = params[:page][:title]
      @page.body = params[:page][:body]
      @page.slug = params[:page][:slug]
      @page.locked = params[:page][:locked]
      @page.user_id = current_user.id

      if @page.save
        redirect_to(admin_pages_path, notice: 'Page was successfully updated.')
      else
        render action: 'edit'
      end
    end

    def destroy
      if @page.deleted_at.present?
        @page.delete
      else
        @page.destroy
      end

      redirect_to(admin_pages_path)
    end

    private

    def set_page
      @page = Page.unscoped.find_by_slug(params[:id])
    end
  end
end
