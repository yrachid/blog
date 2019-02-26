+++
draft = true
date = "2018-01-01T00:00:00-00:00"
title = "Idiomatic object creation in Java"
slug = ""
tags = []
categories = []
+++

We've created a Slack bot in my team to automate a few things. One of the bot tasks is to query Jira and show all open incidents. In order
to do that, we must create domain classes to represent the Jira response structure. It ended up being something more less like the
following:

```java
public final class Issue {

  private String key;
  private Fields fields;

  public static final class Fields {
    private String summary;
    private IncidentSeverity severity;
    private List<Tag> tags;

    public static final class IncidentSeverity {
      private String severity;
    }

    public static final class Tag {
      private String value;
    }
  }

}
```

Since these classes will be used to represent the Response of a json based external service, they must be supported by a (de)serialization
library. In this case, we went with Jackson and the quickest way to make our classes compatible with Jackson is to make them follow the bean
convention (no args constructor, getters and setters). It would be less cumbersome to go with immutable classes, having all attributes
immutable and an all args constructor. With some tweaking, Jackson works well with value classes, but we did not have time for that.


### Lombok

One (not so) quick win to make this easier on the eyes, is to use [Lombok](https://projectlombok.org/):

```java
import lombok.Data;

@Data
public final class Issue {

  private String key;
  private Fields fields;

  @Data
  public static final class Fields {
    private String summary;
    private IncidentSeverity severity;

    @Data
    public static finial class IncidentSeverity {
      private String severity;
    }

    @Data
    public static final class Tag {
      private String value;
    }
  }

}
```

The Data annotation will generate the boilerplate code to make this class a Java Bean:
  - No args constructor
  - Getters and setters
  - toString, equals and hashCode

### The traditional way

```java
Issue issue = new Issue();
issue.setKey("RFS-400");

Fields fields = new Fields();
fields.setSummary("Website is down");

Severity severity = new Severity();
severity.setValue("Critical");

Tag frontEndTag = new Tag();
fontEndTag.setValue("front-end");

Tag infraTag = new Tag();
infraTag.setValue("infrastructure");

List<Tag> tags = Arrays.asList(frontEndTag, infraTag);

fields.setSeverity(severity);
fields.setTags(tags);

issue.setFields(fields);
```

### Static blocks

```java

import static java.util.Arrays.asList;

Issue issue = new Issue() {{
  setKey("RFS-400");

  setFields(new Issue.Fields() {{
    setSummary("Website is down");

    setSeverity(new Issue.Fields.Severity() {{
      setValue("Critical");
    }});

    setTags(asList(
      new Tag() {{
        setValue("front-end");
      }},
      new Tag() {{
        setValue("infrastructure");
      }}
    ));
  }});
}};
```

Static blocks work specially well with value classes (those with immutable attributes):

```java
Issue issue = new Issue() {{
  key = "RFS-400";

  fields = new Issue.Fields() {{
    summary = "Website is down";

    severity = new Issue.Fields.Severity() {{
      value = "Critical";
    }};

    tags = asList(
      new Tag() {{
        value = "front-end";
      }},
      new Tag() {{
        value = "infrastructure";
      }}
    );

  }});
}};

```

### Lambda based builders

```java
import static IssueCreator.issue;

Issue issue = issue(issue -> issue
  .key("RFS-400")
  .fields(fields -> fields
    .summary("Website is down")
    .severity(severity -> severity
      .value("Critical")
    )
    .tag("front-end")
    .tag("infrastructure")
  )
);
```

### Bonus: Kotlin named parameters

```kotlin
class Issue(
  
)
```
