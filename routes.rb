resource "pokes" do
  get url: "/", controller: "PokeController", method: "root"
  get url: "return", controller: "PokeController", method: "return"
  get url: "return/:time", controller: "PokeController", method: "return_for"
end
