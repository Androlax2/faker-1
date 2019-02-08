Feature: Fake posts

  Scenario: Generate posts
    Given a WP install
    And a post.yml file:
    """
    Trendwerk\Faker\Entity\Post:
      post{1..10}:
        post_content: <paragraphs(4, true)>
        post_title: '<sentence()>'
    """

    When I run `wp faker fake post.yml`
    Then STDOUT should contain:
      """
      Generated 10 new objects.
      """

    When I run `wp post list --meta_key=_fake --format=count`
    Then STDOUT should be:
      """
      10
      """

  Scenario: Generate posts using deprecated Faker\Post
    Given a WP install
    And a post.yml file:
    """
    Trendwerk\Faker\Post:
      post{1..10}:
        post_content: <paragraphs(4, true)>
        post_title: '<sentence()>'
    """

    When I run `wp faker fake post.yml`
    Then STDOUT should contain:
      """
      Generated 10 new objects.
      """

    When I run `wp post list --meta_key=_fake --format=count`
    Then STDOUT should be:
      """
      10
      """

  Scenario: Generate pages
    Given a WP install
    And a post.yml file:
    """
    Trendwerk\Faker\Entity\Post:
      post{1..30}:
        post_content: <paragraphs(4, true)>
        post_title: '<sentence()>'
        post_type: 'page'
    """

    When I run `wp faker fake post.yml`
    Then STDOUT should contain:
      """
      Generated 30 new objects.
      """

    When I run `wp post list --meta_key=_fake --format=count --post_type=page`
    Then STDOUT should be:
      """
      30
      """

  Scenario: Generate posts with a category
    Given a WP install
    And a post.yml file:
    """
    Trendwerk\Faker\Entity\Post:
      post{1..15}:
        post_content: <paragraphs(4, true)>
        post_title: '<sentence()>'
        terms:
          category: <terms('category', 1)>
    """

    When I run `wp faker fake post.yml`
    Then STDOUT should contain:
      """
      Generated 15 new objects.
      """

    When I run `wp post list --meta_key=_fake --format=count`
    Then STDOUT should be:
      """
      15
      """
