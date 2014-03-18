require 'spec_helper'

describe I18n::ActiveRecord::Scoped do
  context 'locale = :en' do
    before { I18n.locale = :en }

    it 'supports additional scopes on translations table' do
      scope = Translation.where(user_id: 1)
      expect(I18n.translate('hello', translations: scope)).to eq 'Hello'

      scope = Translation.where(user_id: 2)
      expect(I18n.translate('hello', translations: scope)).to eq 'Good morning'
    end
  end

  context 'locale = :es' do
    before { I18n.locale = :es }

    it 'supports additional scopes on translations table' do
      scope = Translation.where(user_id: 1)
      expect(I18n.translate('hello', translations: scope)).to eq 'Hola'

      scope = Translation.where(user_id: 2)
      expect(I18n.translate('hello', translations: scope)).to eq 'Buenos días'
    end
  end

  context 'locale = :de' do
    before { I18n.locale = :de }

    it 'supports additional scopes on translations table' do
      scope = Translation.where(user_id: 1)
      expect(I18n.translate('hello', translations: scope)).to eq 'Hallo'

      scope = Translation.where(user_id: 2)
      expect(I18n.translate('hello', translations: scope)).to eq 'translation missing: de.hello'
    end
  end

  context 'locale = :jp' do
    before { I18n.locale = :jp }

    it 'supports additional scopes on translations table' do
      scope = Translation.where(user_id: 1)
      expect(I18n.translate('hello', translations: scope)).to eq 'translation missing: jp.hello'

      scope = Translation.where(user_id: 2)
      expect(I18n.translate('hello', translations: scope)).to eq 'おはよう'
    end
  end
end
