# frozen_string_literal: true

module ApplicationHelper
  INFORMATION_ATTRIBUTES = %w[description notes history].freeze

  def record_information_attributes(record)
    INFORMATION_ATTRIBUTES.map do |attr|
      next unless record.respond_to?(attr)

      {
        name: attr,
        title: I18n.t("attributes.#{attr}"),
        text: record.send(attr),
        type: :text_area,
        id: "record_#{record.id}_#{attr}"
      }
    end.compact
  end
end
