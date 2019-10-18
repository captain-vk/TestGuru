class TestPassagesController < ApplicationController
  def update
    @test = Test.find(params[:id]) 

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end

   def destroy
    @test = Test.find(params[:id])

    @test.destroy
    redirect_to tests_path
   end 

   def start
    @test = Test.find(params[:id])
    @user.tests.push
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
