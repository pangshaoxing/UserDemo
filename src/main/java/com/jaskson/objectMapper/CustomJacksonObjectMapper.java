package com.jaskson.objectMapper;

import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.xc.JaxbAnnotationIntrospector;
import org.springframework.stereotype.Controller;

@Controller
public class CustomJacksonObjectMapper extends ObjectMapper {

@SuppressWarnings("deprecation")
public CustomJacksonObjectMapper() {
    super();
    final AnnotationIntrospector introspector = new JaxbAnnotationIntrospector();

    this.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.UNWRAP_ROOT_VALUE, true);
    this.configure(org.codehaus.jackson.map.SerializationConfig.Feature.WRAP_ROOT_VALUE, true);

    this.configure(org.codehaus.jackson.map.SerializationConfig.Feature.WRITE_NULL_PROPERTIES, false);

    this.setDeserializationConfig(this.getDeserializationConfig().withAnnotationIntrospector(introspector));
    this.setSerializationConfig(this.getSerializationConfig().withAnnotationIntrospector(introspector));

   }
}
