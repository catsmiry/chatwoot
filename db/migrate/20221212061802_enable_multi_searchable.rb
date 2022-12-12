class EnableMultiSearchable < ActiveRecord::Migration[6.1]
  def up
    Contact.rebuild_pg_search_documents
    PgSearch::Multisearch.rebuild(Conversation)
    PgSearch::Multisearch.rebuild(Message)
  end

  def down
    PgSearch::Document.delete_all
  end
end
