class ProductsDataResponseModel {
  List<Categories> categories;
  List<Rankings> rankings;

  ProductsDataResponseModel({this.categories, this.rankings});

  ProductsDataResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['rankings'] != null) {
      rankings = new List<Rankings>();
      json['rankings'].forEach((v) {
        rankings.add(new Rankings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.rankings != null) {
      data['rankings'] = this.rankings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int id;
  String name;
  List<Products> products;
  List<int> childCategories;

  Categories({this.id, this.name, this.products, this.childCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    childCategories = json['child_categories'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['child_categories'] = this.childCategories;
    return data;
  }
}

class Products {
  int id;
  String name;
  String dateAdded;
  List<Variants> variants;
  Tax tax;

  Products({this.id, this.name, this.dateAdded, this.variants, this.tax});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateAdded = json['date_added'];
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_added'] = this.dateAdded;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    if (this.tax != null) {
      data['tax'] = this.tax.toJson();
    }
    return data;
  }
}

class Variants {
  int id;
  String color;
  int size;
  int price;

  Variants({this.id, this.color, this.size, this.price});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['size'] = this.size;
    data['price'] = this.price;
    return data;
  }
}

class Tax {
  String name;
  double value;

  Tax({this.name, this.value});

  Tax.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = double.parse(json['value'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Rankings {
  String ranking;
  List<RankingProducts> products;

  Rankings({this.ranking, this.products});

  Rankings.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    if (json['products'] != null) {
      products = new List<RankingProducts>();
      json['products'].forEach((v) {
        products.add(new RankingProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ranking'] = this.ranking;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RankingProducts {
  int id;
  int viewCount;
  int orderCount;
  int shares;

  RankingProducts({this.id, this.viewCount, this.orderCount, this.shares});

  RankingProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    viewCount = json['view_count'];
    orderCount = json['order_count'];
    shares = json['shares'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['view_count'] = this.viewCount;
    data['order_count'] = this.orderCount;
    data['shares'] = this.shares;
    return data;
  }
}