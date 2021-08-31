require 'rails_helper'

RSpec.describe ProceduresController, type: :request  do
  describe 'Check results' do
    before :all do
      Procedure.destroy_all
      Procedure.create title: 'Test procedure'
      Procedure.create title: 'Biopsy test'
      Procedure.create title: 'Fake'
    end

    it 'without search' do
      get procedures_path(query: ''), as: :json
      expect(JSON.parse(response.body).count).to eq Procedure.count
    end

    it 'with search' do
      get procedures_path(query: 'Test'), as: :json
      expect(json.count).to eq Procedure.where('title ILIKE ?', '%test%').count
      expect(json[0]['title']).to eq 'Test procedure'
      expect(json[1]['title']).to eq 'Biopsy test'
    end
   
    it 'add procedure' do
      post procedures_path, params: {procedure: {title: 'Endoscopy'} }
      expect(Procedure.find_by(title: 'Endoscopy')).to be_truthy
    end

  end
end
