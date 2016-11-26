require 'command'

describe FreshErd do
  it 'has a version number' do
    expect(FreshErd::VERSION).not_to be nil
  end
end

describe Command do
  let(:options) { {} }
  let(:diagrams) { { tweet: %w(User Micropost) } }

  before do
    allow_any_instance_of(FreshErd::GenerateErd).to receive(:generate_domain_erd)
    allow_any_instance_of(FreshErd::GenerateErd).to receive(:generate_project_erd)
    $stdout = StringIO.new
    Command.new.invoke(:generate, [], options)
  end

  subject { $stdout.string }

  context "オプションの指定がない場合(設定ファイルが見つからない)" do
    it { is_expected.to include "--- input: File not found!" }
    it { is_expected.to include "Instead, it outputs for all models." }
  end

  context "入力ファイルの場所をオプションで指定" do
    let(:options) { { input: "spec/support/fresh_erd.yml" } }
    it { is_expected.to include "--- Generate ERD : tweet" }
    it { is_expected.to include "--- Generate ERD : all" }
  end

  context "入力ファイルの場所をオプションで指定(設定ファイルが見つからない)" do
    let(:options) { { input: "spec/support/invalid_erd.yml" } }
    it { is_expected.to include "--- input: File not found!" }
    it { is_expected.to include "Instead, it outputs for all models." }
  end

  context "出力ファイルの場所をオプションで指定" do
    let(:options) { { input: "spec/support/fresh_erd.yml", output: "spec/support/" } }
    it { is_expected.to include "--- Generate ERD : tweet" }
    it { is_expected.to include "--- Generate ERD : all" }
  end

  context "出力ファイルの場所をオプションで指定(出力フォルダが見つからない)" do
    let(:options) { { input: "spec/support/fresh_erd.yml", output: "spec/dummy/" } }
    it { is_expected.to include "--- output: Folder not found!" }
    it { is_expected.to include "--- Stop the output of ERD." }
  end
end