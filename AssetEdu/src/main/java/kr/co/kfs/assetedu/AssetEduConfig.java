package kr.co.kfs.assetedu;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

import lombok.Data;

@ConfigurationProperties(prefix = "kr.co.kfs.assetedu")
@Component
@Data
@Validated
public class AssetEduConfig {
	private String title;
	private String gitSourceUrl;
}
