require 'csv'

class ImportsController < ApplicationController
  def index
    @purchases = Purchase.all
    @sum_total = 0
    @purchases.each do |p|
      @sum_total += p.item_price + p.purchase_count
    end
  end

  def upload
    uploaded_io = params[:file]
    csv_options = { col_sep: "\t", headers: :first_row, header_converters: :symbol }


    CSV.foreach(uploaded_io.path, csv_options) do |row|
      # Here, row is an array of columns
      Purchase.create! row.to_hash
    end
    redirect_to imports_url
    flash[:success] = "Tabela importada com sucesso!"
  end
end
