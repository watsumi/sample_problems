# frozen_string_literal: true

RSpec.describe SampleProblems::List do
  describe "#all" do
    it "return all question data" do
      expect(described_class.all.size).to eq(82)
    end
  end

  describe "#select_random" do
    it "return one question" do
      expect(described_class.select_random.size).to eq(3)
    end
  end

  describe "#find_by_contens_id" do
    context "when find contens_id in data" do
      let(:contens_id) { "abc063" }

      it "return four question" do
        expected_arr = [
          { contens_id: "abc063", id: "abc063_a", title: "A. Restricted" },
          { contens_id: "abc063", id: "abc063_b", title: "B. Varied" },
          { contens_id: "abc063", id: "arc075_a", title: "C. Bugged" },
          { contens_id: "abc063", id: "arc075_b", title: "D. Widespread" }
        ]
        expect(described_class.find_by_contens_id(contens_id)).to eq(expected_arr)
      end
    end

    context "when find contens_id in data" do
      let(:contens_id) { "aaa000" }

      it "return Hyakumeizan::List::NoQuestionDataError" do
        expect do
          described_class.find_by_contens_id("aaa000")
        end.to raise_error(SampleProblems::List::NoQuestionDataError)
      end
    end
  end
end
