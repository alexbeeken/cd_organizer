require('rspec')
require('cd_organizer')

describe("Artist") do
  before do
    Artist.clear()
  end

  describe("#initialize") do
    it("will create an instance and return an artist") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      expect(test_album.artist).to(eq("Eminem"))
    end
    it("will create an instance and return an album") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      expect(test_album.albums).to(eq(["The Slim Shady LP"]))
    end
    it("will return array of artist instances") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      expect(Artist.get_collection).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the instance of artist into the collection") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      test_album.save()
      expect(Artist.get_collection()).to(eq([test_album]))
    end
  end

  describe(".clear") do
    it("will clear all artist instances from the collection array") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      test_album.save()
      Artist.clear()
      expect(Artist.get_collection()).to(eq([]))
    end
  end

  describe("#add_album") do
    it("will add an album title to an already existing artist") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      test_album.save()
      test_album.add_album("The Marshall Mathers LP")
      expect(test_album.albums()).to(eq(["The Slim Shady LP", "The Marshall Mathers LP"]))
    end
  end

  describe("#delete_album") do
    it("removes the album from the artist's discography") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      test_album.add_album("The Marshall Mathers LP")
      test_album.save()
      test_album.delete_album("The Slim Shady LP")
      expect(test_album.albums()).to(eq(["The Marshall Mathers LP"]))
    end
  end

  describe(".delete_artist") do
    it("removes the specified artist from the collection") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      test_album.save()
      Artist.delete_artist(test_album)
      expect(Artist.get_collection()).to(eq([]))
    end
  end

  describe(".find_artist") do
    it("returns artist object for the artist name") do
      test_album = Artist.new({:artist => "Eminem", :albums => "The Slim Shady LP"})
      test_album.save()
      find_album = Artist.find_artist("Eminem")
      expect(find_album).to(eq(test_album))
    end
  end


end
