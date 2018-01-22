class CategoryController < ApplicationController
  def index
    categories = Category.all
    render("index.slang")
  end

  def show
    if category = Category.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Category with ID #{params["id"]} Not Found"
      redirect_to "/categories"
    end
  end

  def new
    category = Category.new
    render("new.slang")
  end

  def create
    category = Category.new(category_params.validate!)

    if category.valid? && category.save
      flash["success"] = "Created Category successfully."
      redirect_to "/categories"
    else
      flash["danger"] = "Could not create Category!"
      render("new.slang")
    end
  end

  def edit
    if category = Category.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Category with ID #{params["id"]} Not Found"
      redirect_to "/categories"
    end
  end

  def update
    if category = Category.find(params["id"])
      category.set_attributes(category_params.validate!)
      if category.valid? && category.save
        flash["success"] = "Updated Category successfully."
        redirect_to "/categories"
      else
        flash["danger"] = "Could not update Category!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Category with ID #{params["id"]} Not Found"
      redirect_to "/categories"
    end
  end

  def destroy
    if category = Category.find params["id"]
      category.destroy
    else
      flash["warning"] = "Category with ID #{params["id"]} Not Found"
    end
    redirect_to "/categories"
  end

  def category_params
    params.validation do
      required(:name) { |f| !f.nil? }
    end
  end
end
