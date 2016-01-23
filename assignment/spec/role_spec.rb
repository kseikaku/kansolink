# encoding: utf-8
# Role(役割))のspec
#2016/1/11
#公演とキャストやレビュアーとの関係を保有する
require "spec_helper"
require "role"
require "roletype"
describe "Roleの振る舞い" do
  describe "PERSONタイプの場合" do
    let(:role){Role.new(Role::CAST)}
    it 'CASTを設定したら、CASTになる' do
      expect(role).to eq Role.new(Role::CAST)
    end
    it 'DIRECTORを追加したら、CASTでもDIRECOTORでもTrue' do
      role << Role.new(Role::DIRECTOR)
      expect(role).to eq Role.new(Role::DIRECTOR)
      expect(role).to eq Role.new(Role::CAST)
      expect(role).not_to eq Role.new(Role::WRITER)
    end
    it 'WRITERを設定したら、CASTでもDIRECTORでもなくなる' do
      expect(role).to eq Role.new(Role::CAST)
      role=Role.new(Role::WRITER)
      expect(role).to eq Role.new(Role::WRITER)
      expect(role).not_to eq Role.new(Role::CAST)
    end
  end  
end