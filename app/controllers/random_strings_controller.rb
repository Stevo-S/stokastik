class RandomStringsController < ApplicationController
  def new
    @random_string = RandomString.new
  end
  
  def create
#     params = params.permit(:maximum, :minimum, :prefix)
    maximum = params[:maximum] ? params[:maximum].to_i : 1000000000000
    minimum = params[:minimum] ? params[:minimum].to_i : 0
    prefix = params[:prefix] ? params[:prefix] : ""
    random_value = Random.new.rand( maximum - minimum) + minimum
    @random_string = RandomString.new(random_value: prefix + random_value.to_s)
    
    if @random_string.save
      redirect_to @random_string
    else
      flash.now[:danger] = "Whoopsie daisy. Random number generation failed for some reason!"
      render 'new'
    end
  end

  def index
    @random_strings = RandomString.order(created_at: :desc).page params[:page]
    
    respond_to do |format|
      format.html
      format.csv  { render text: @random_strings.to_csv }
      format.xls  { send_file @random_strings.to_xls }
    end
  end
  
  def show
    @random_string = RandomString.find_by_id(params[:id])
  end
end
