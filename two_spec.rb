# NEED TO ADD BETTER TESTS. Need to compare actual known input/output pairs!
describe JW do
  describe "#encode" do
    context "correct input" do
      it "returns an array of numbers" do
        expect(JW.encode("")).to be_an_instance_of(Array)
        expect(JW.encode("d")).to be_an_instance_of(Array)
      end
      it "returns output of equal length to the input" do
        5.times do
          @num = rand(10)
          expect(JW.encode("abcde").length).to be(5)
          expect(JW.encode("a"*@num).length).to be(@num)
        end
      end
      it "returns only positive numbers" do
        expect(JW.encode("abcde").min).to be >= 0
      end
    end
    context "incorrect input" do
      # Not yet defined. Will include:
      # - characters that do not appear in cypher
    end
  end
  describe "#decode" do
    context "correct input" do
      it "returns a string" do
        expect(JW.decode([])).to be_an_instance_of(String)
        expect(JW.decode([0])).to be_an_instance_of(String)
      end
      it "returns only chars that appear in cypher" do
        # Not sure how to test this
      end
      it "returns output of equal length to the input" do
        5.times do
          @num = rand(10)
          expect(JW.decode([1,2,3,4,5]).length).to be(5)
          expect(JW.decode([2]*@num).length).to be(@num)
        end
      end
    end
  end
end
