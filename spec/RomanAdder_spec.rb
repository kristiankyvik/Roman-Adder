
class RomanAdder


	def initialize 
		@translate={
			"I"=> 1,
			"V"=> 5,
			"X"=> 10,
			"L"=> 50,
			"C"=> 100,
			"D"=> 500,
			"M"=> 1000
		}


		@rank={
			"I"=>0,
			"V"=>1,
			"X"=>2,
			"L"=>3,
			"C"=>4,
			"D"=>5,
			"M"=>6
		}
	end

	def converter(roman)
		return @translate[roman] if roman.size==1

		result=0
		array_char=roman.split("").reverse

		result+=@translate[array_char[0]]

		for i in 1..array_char.size-1
			puts array_char[0]
			if @rank[array_char[i]]<@rank[array_char[i-1]]
				result=result-@translate[array_char[i]]
			else
				result+=@translate[array_char[i]]
			end
			
		end
		result
	end

	
	
end



describe "roman adder" do
	it "converts one I to I" do
		expect(RomanAdder.new.converter("I")).to eq(1)
	end

	it "converts II to II" do
		expect(RomanAdder.new.converter("II")).to eq(2)
	end

	it "converts IV to IIII" do
		expect(RomanAdder.new.converter("IV")).to eq(4)
	end

	it "converts X to 10" do
		expect(RomanAdder.new.converter("X")).to eq(10)
	end

	it "converts 3" do
		expect(RomanAdder.new.converter("XXVI")).to eq(26)
	end

	it "converts skdnkjnf" do
		expect(RomanAdder.new.converter("MXXII")).to eq(1022)
	end

end
