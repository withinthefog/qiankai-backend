class JSONParseError
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue ActionDispatch::ParamsParser::ParseError => e
      [422, {}, [{message: 'parse parameters error'}.to_json]]
    end
  end
end