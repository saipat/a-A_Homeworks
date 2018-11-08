require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("Sai") }
  let(:milkshake) { Dessert.new("milkshake", 60, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(milkshake.type).to eq("milkshake")
    end

    it "sets a quantity" do
      expect(milkshake.quantity).to eq(60)
    end

    it "starts ingredients as an empty array"do
      expect(milkshake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cake", "popsicle", chef)}.to raise_error (ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      milkshake.add_ingredient("sugar")
      expect(milkshake.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["milk", "sugar", "cream", "ice cream", "nuts"]
      ingredients.each do |ingredient|
        milkshake.add_ingredient(ingredient)
      end
      expect(milkshake.ingredients).to eq(ingredients)
      milkshake.mix!
      expect(milkshake.ingredients).not_to eq(ingredients)
      expect(milkshake.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      milkshake.eat(20)
      expect(milkshake.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{milkshake.eat(90)}.to raise_error("not enough left!")
    end
  end


  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Sai")
     expect(milkshake.serve).to eq("Sai has made 60 milkshakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(milkshake)
      milkshake.make_more
    end
  end
end
