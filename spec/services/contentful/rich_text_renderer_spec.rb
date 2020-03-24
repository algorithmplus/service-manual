require 'rails_helper'

RSpec.describe Contentful::Area, :type => :model do

  rich = {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "This is an H1 for assessments at DfE area", "nodeType" => "text"}], "nodeType" => "heading-1"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "Text after H1", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "This is an H2", "nodeType" => "text"}], "nodeType" => "heading-2"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "Text after H2", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "This is an H3", "nodeType" => "text"}], "nodeType" => "heading-3"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "Text after H3", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "This is ", "nodeType" => "text"}, {"data" => {}, "marks" => [{"type" => "bold"}], "value" => "bold", "nodeType" => "text"}, {"data" => {}, "marks" => [], "value" => ", this is ", "nodeType" => "text"}, {"data" => {}, "marks" => [{"type" => "italic"}], "value" => "italic", "nodeType" => "text"}, {"data" => {}, "marks" => [], "value" => ", this is ", "nodeType" => "text"}, {"data" => {}, "marks" => [{"type" => "underline"}], "value" => "underlined", "nodeType" => "text"}, {"data" => {}, "marks" => [], "value" => ", this is ", "nodeType" => "text"}, {"data" => {}, "marks" => [{"type" => "bold"}, {"type" => "underline"}, {"type" => "italic"}], "value" => "all 3", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [], "nodeType" => "hr"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "To be or not to be", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "blockquote"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [{"type" => "code"}], "value" => "$foo = bar", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "My list:", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "one", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "two ", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "three", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}], "nodeType" => "unordered-list"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "My numbers", "nodeType" => "text"}], "nodeType" => "paragraph"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "one", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "two", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "three", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}, {"data" => {}, "content" => [{"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "four", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "list-item"}], "nodeType" => "ordered-list"}, {"data" => {}, "content" => [{"data" => {}, "marks" => [], "value" => "", "nodeType" => "text"}], "nodeType" => "paragraph"}], "nodeType" => "document"}

  describe 'areas' do
    context 'when we ask for first area' do
      it 'Content is returned and value for heading is as expected' do
        renderer = RichTextRenderer::Renderer.new(
          'heading-1' => ContentfulRenderers::HeadingOneRenderer,
        )
        rendered = renderer.render(rich)
        expect(rendered).to eq('Assessments at DfE')
      end
    end
  end
end
