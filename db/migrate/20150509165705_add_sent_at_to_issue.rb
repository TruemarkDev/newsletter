# frozen_string_literal: true
class AddSentAtToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :sent_at, :datetime
  end
end
