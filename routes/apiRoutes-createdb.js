var db = require("../models");
var faker = require('faker');
var realtor = require('realtorca');

module.exports = function (app) {
  /////////// Routes for CLIENTS ///////////
  setTimeout(createdb, 2000);
  // Client login
  app.get("/api/client/:id", function (req, res) {
    db.client
      .findOne({
        where: {
          username: req.params.id
        }
      })
      .then(function (dbClient) {
        // console.log("= API CALL =======================");
        // console.log("Username: " + dbClient.username);
        // console.log("Password: " + dbClient.password);
        // console.log("ID: " + dbClient.id);
        res.json(dbClient);
      });
  });

  // Updating existing client based on clientId
  app.post("/api/client/:id", function (req, res) {
    var clientId = req.body.clientId;

    db.client
      .update(
        {
          username: req.body.username,
          password: req.body.password,
          firstName: req.body.firstName,
          lastName: req.body.lastName,
          email: req.body.email,
          phone: req.body.phone,
        },
        {
          where: {
            id: clientId
          }
        }
      )
      .then(function () {
        res.json(clientId);
      });
  });

  /////////// Routes for OWNERS ///////////

  // Owner login
  app.get("/api/owner/:username", function (req, res) {
    db.owner
      .findOne({
        where: {
          username: req.params.username
        }
      })
      .then(function (dbOwner) {
        // console.log("= API CALL =======================");
        // console.log("Username: " + dbClient.username);
        // console.log("Password: " + dbClient.password);
        // console.log("ID: " + dbClient.id);
        res.json(dbOwner);
      });
  });

  // Updating existing owner based on ownerId
  app.post("/api/owner/:id", function (req, res) {
    var ownerId = req.body.ownerId;

    db.owner
      .update(
        {
          username: req.body.username,
          password: req.body.password,
          firstName: req.body.firstName,
          lastName: req.body.lastName,
          email: req.body.email,
          phone: req.body.phone,
          address1: req.body.address1,
          address2: req.body.address2,
          city: req.body.city,
          province: req.body.province,
          country: req.body.country
        },
        {
          where: {
            id: ownerId
          }
        }
      )
      .then(function () {
        res.json(ownerId);
      });
  });

  /////////// Routes for PROPERTIES ///////////

  // Adding a new property
  app.post("/api/property", function (req, res) {
    // Update takes in an object describing the properties we want to update, and
    // we use where to describe which objects we want to update
    db.property
      .create({
        info: req.body.info,
        address1: req.body.address1,
        address2: req.body.address2,
        postalcode: req.body.postalcode,
        propertype: req.body.propertype,
        price_string: req.body.price_string,
        price_dec: req.body.price_dec,
        bedrooms: req.body.bedrooms,
        bathrooms: req.body.bathrooms,
        ownershiptype: req.body.ownershiptype,
        ammenities: req.body.ammenities,
        ammenitiesnearby: req.body.ammenitiesnearby,
        photo: req.body.photo,
        ownerId: req.body.ownerId
      })
      .then(function (dbProperty) {
        res.json(dbProperty);
      });
  });

  // Updating existing property based on propertyId
  app.post("/api/property/:id", function (req, res) {
    var ownerId = req.body.ownerId;

    db.property
      .update(
        {
          info: req.body.info,
          address1: req.body.address1,
          address2: req.body.address2,
          postalcode: req.body.postalcode,
          propertype: req.body.propertype,
          price_string: req.body.price_string,
          price_dec: req.body.price_dec,
          bedrooms: req.body.bedrooms,
          bathrooms: req.body.bathrooms,
          ownershiptype: req.body.ownershiptype,
          ammenities: req.body.ammenities,
          ammenitiesnearby: req.body.ammenitiesnearby,
          photo: req.body.photo
        },
        {
          where: {
            id: req.params.id
          }
        }
      )
      .then(function () {
        res.json(ownerId);
      });
  });

  // Delete existing property based on propertyId
  app.delete("/api/property/:id", function (req, res) {
    db.property
      .destroy({
        where: {
          id: req.params.id
        }
      })
      .then(function (data) {
        res.json(data);
      });
  });
};

var createdb = function () {
  console.log("Im getting here")
  var locations = [
    {
      city: "Toronto",
      province: "Ontario",
      latitude: 43.6532,
      longitude: -79.3832
    },
    {
      city: "Mississauga",
      province: "Ontario",
      latitude: 43.5890,
      longitude: -79.6441
    },
    {
      city: "London",
      province: "Ontario",
      latitude: 42.9849,
      longitude: -81.2453
    },
    {
      city: "Calgary",
      province: "Alberta",
      latitude: 51.0486,
      longitude: -114.0708
    },
    {
      city: "Vancouver",
      province: "British Columbia",
      latitude: 49.2827,
      longitude: -123.1207
    },
    {
      city: "Montreal",
      province: "Quebec",
      latitude: 45.5017,
      longitude: -73.5673
    }
  ]

  clients =[
    {
      username: "tmedina",
      password: "pass1",
      firstName: "Tariq",
      lastName: "Medina",
      email: "tmedina@one.ca",
      phone: faker.phone.phoneNumber()
    },
    {
      username: "jdiaz",
      password: "pass2",
      firstName: "Juan",
      lastName: "Diaz",
      email: "jdiaz@two.ca",
      phone: faker.phone.phoneNumber()
    },
    {
      username: "tgreen",
      password: "pass3",
      firstName: "Tony",
      lastName: "Green",
      email: "tmedina@one.ca",
      phone: faker.phone.phoneNumber()
    },
  ]
 for (i of clients){
  db.client
  .create(
    {
      username: i.username,
      password: i.password,
      firstName: i.firstName,
      lastName: i.lastName,
      email: i.email,
      phone: i.phone,
    }
  )
  .then(function () {
  });
 }

  for (i = 0; i < 8; i++) {
    var j = Math.floor(Math.random() * 6);
    var owner = {
      firstName: faker.name.firstName(),
      lastName: faker.name.lastName(),
      email: faker.internet.email(),
      phone: faker.phone.phoneNumber(),
      address1: faker.address.secondaryAddress(),
      address2: faker.address.streetAddress(),
      city: locations[j].city,
      province: locations[j].province,
      country: "Canada"
    };
    owner.username = owner.firstName + owner.lastName;
    // console.log(property);
    db.owner.create(owner).then(function (newowner) {
      // property.ownerId = newowner.id;
      // db.property.create(property).then(function (newproperty) {}) ;

    })
  }
  for (k in locations) {
    let opts = {
      LongitudeMin: locations[k].longitude - 0.035,
      LongitudeMax: locations[k].longitude + 0.035,
      LatitudeMin: locations[k].latitude - 0.035,
      LatitudeMax: locations[k].latitude + 0.035,
      PriceMin: 100000,
      PriceMax: 1000000,
      RecordsPerPage: 5
    };
    realtor.post(opts)
      .then((data) => {

        //json response
        for (i in data.Results) {
          var number = Number(data.Results[i].Property.Price.replace(/[^0-9.-]+/g, ""));

          // console.log(data.Results[i].Property.Address.AddressText);
          var property = {
            // ownerid:
            info: data.Results[i].PublicRemarks.replace(/'/gi, "*"),
            address1: data.Results[i].Property.Address.AddressText.split("|")[0],
            address2: data.Results[i].Property.Address.AddressText.split("|")[1].slice(0, -7),
            postalcode: data.Results[i].PostalCode,
            propertytype: data.Results[i].Building.Type,
            price_string: data.Results[i].Property.Price,
            price_dec: number,
            bedrooms: data.Results[i].Building.Bedrooms,
            bathrooms: data.Results[i].Building.BathroomTotal,
            ownershiptype: data.Results[i].Property.OwnershipType,
            ammenities: data.Results[i].Building.Ammenities,
            ammenitiesnearby: data.Results[i].Property.AmmenitiesNearBy,
            ownerId: (Math.floor(Math.random() * 8) + 1),
            photo: data.Results[i].Property.Photo[0].HighResPath
          };

          db.property.create(property).then(function (newproperty) { });
          //   });
          // });
        }
      })
  }
}