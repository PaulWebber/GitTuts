  <!-- ========================= NUMBER FORMATS ========================= -->
  <xsl:decimal-format name="id1342257" decimal-separator="." grouping-separator=","/>
  <xsl:decimal-format name="id1248482" decimal-separator="." grouping-separator=","/>
  <xsl:decimal-format name="id1248555" decimal-separator="."/>
  <!-- ======================== DURATION FORMATS ======================== -->
  <xslt:template name="date:format-duration">
    <xslt:param name="duration" select="''"/>
    <xslt:param name="pattern"/>
    <xslt:variable name="duration-sign">
      <xslt:value-of select="substring-before($duration, 'P')"/>
    </xslt:variable>
    <xslt:variable name="years">
      <xslt:call-template name="date:extract-duration-component">
        <xslt:with-param name="duration-str" select="$duration"/>
        <xslt:with-param name="duration-component" select="'years'"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="months">
      <xslt:call-template name="date:extract-duration-component">
        <xslt:with-param name="duration-str" select="$duration"/>
        <xslt:with-param name="duration-component" select="'months'"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="days">
      <xslt:call-template name="date:extract-duration-component">
        <xslt:with-param name="duration-str" select="$duration"/>
        <xslt:with-param name="duration-component" select="'days'"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="hours">
      <xslt:call-template name="date:extract-duration-component">
        <xslt:with-param name="duration-str" select="$duration"/>
        <xslt:with-param name="duration-component" select="'hours'"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="minutes">
      <xslt:call-template name="date:extract-duration-component">
        <xslt:with-param name="duration-str" select="$duration"/>
        <xslt:with-param name="duration-component" select="'minutes'"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="seconds">
      <xslt:call-template name="date:extract-duration-component">
        <xslt:with-param name="duration-str" select="$duration"/>
        <xslt:with-param name="duration-component" select="'seconds'"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="years-formated">
      <xslt:call-template name="str:replace-string">
        <xslt:with-param name="text" select="normalize-space($pattern)"/>
        <xslt:with-param name="from" select="'YYY'"/>
        <xslt:with-param name="to" select="normalize-space($years)"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="months-formated">
      <xslt:call-template name="str:replace-string">
        <xslt:with-param name="text" select="normalize-space($years-formated)"/>
        <xslt:with-param name="from" select="'MMM'"/>
        <xslt:with-param name="to" select="normalize-space($months)"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="days-formated">
      <xslt:call-template name="str:replace-string">
        <xslt:with-param name="text" select="normalize-space($months-formated)"/>
        <xslt:with-param name="from" select="'DDD'"/>
        <xslt:with-param name="to" select="normalize-space($days)"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="hours-formated">
      <xslt:call-template name="str:replace-string">
        <xslt:with-param name="text" select="normalize-space($days-formated)"/>
        <xslt:with-param name="from" select="'HH'"/>
        <xslt:with-param name="to" select="normalize-space($hours)"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="minutes-formated">
      <xslt:call-template name="str:replace-string">
        <xslt:with-param name="text" select="normalize-space($hours-formated)"/>
        <xslt:with-param name="from" select="'MM'"/>
        <xslt:with-param name="to" select="normalize-space($minutes)"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:variable name="seconds-formated">
      <xslt:call-template name="str:replace-string">
        <xslt:with-param name="text" select="normalize-space($minutes-formated)"/>
        <xslt:with-param name="from" select="'SS'"/>
        <xslt:with-param name="to" select="normalize-space($seconds)"/>
      </xslt:call-template>
    </xslt:variable>
    <xslt:value-of select="concat($duration-sign, $seconds-formated)" disable-output-escaping="yes"/>
  </xslt:template>
  <xslt:template name="date:extract-duration-component">
    <xslt:param name="duration-str" select="''"/>
    <xslt:param name="duration-component" select="''"/>
    <xslt:variable name="duration-date">
      <xslt:choose>
        <xslt:when test="contains($duration-str, 'T')">
          <xslt:value-of select="substring-before(substring-after($duration-str, 'P'), 'T')"/>
        </xslt:when>
        <xslt:otherwise>
          <xslt:value-of select="substring-after($duration-str, 'P')"/>
        </xslt:otherwise>
      </xslt:choose>
    </xslt:variable>
    <xslt:variable name="duration-time" select="substring-after($duration-str, 'T')"/>
    <xslt:variable name="duration-component-value">
      <xslt:choose>
        <xslt:when test="$duration-str = ''"/>
        <xslt:otherwise>
          <xslt:choose>
            <xslt:when test="$duration-component = 'years'">
              <xslt:value-of select="substring-before($duration-date, 'Y')"/>
            </xslt:when>
            <xslt:when test="$duration-component = 'months'">
              <xslt:choose>
                <xslt:when test="contains($duration-date, 'Y')">
                  <xslt:value-of select="substring-before(substring-after($duration-date, 'Y'), 'M')"/>
                </xslt:when>
                <xslt:otherwise>
                  <xslt:value-of select="substring-before($duration-date, 'M')"/>
                </xslt:otherwise>
              </xslt:choose>
            </xslt:when>
            <xslt:when test="$duration-component = 'days'">
              <xslt:choose>
                <xslt:when test="contains($duration-date, 'M')">
                  <xslt:value-of select="substring-before(substring-after($duration-date, 'M'), 'D')"/>
                </xslt:when>
                <xslt:when test="contains($duration-date, 'Y')">
                  <xslt:value-of select="substring-before(substring-after($duration-date, 'Y'), 'D')"/>
                </xslt:when>
                <xslt:otherwise>
                  <xslt:value-of select="substring-before($duration-date, 'D')"/>
                </xslt:otherwise>
              </xslt:choose>
            </xslt:when>
            <xslt:when test="$duration-component = 'hours'">
              <xslt:value-of select="substring-before($duration-time, 'H')"/>
            </xslt:when>
            <xslt:when test="$duration-component = 'minutes'">
              <xslt:choose>
                <xslt:when test="contains($duration-time, 'H')">
                  <xslt:value-of select="substring-before(substring-after($duration-time, 'H'), 'M')"/>
                </xslt:when>
                <xslt:otherwise>
                  <xslt:value-of select="substring-before($duration-time, 'M')"/>
                </xslt:otherwise>
              </xslt:choose>
            </xslt:when>
            <xslt:when test="$duration-component = 'seconds'">
              <xslt:choose>
                <xslt:when test="contains($duration-time, 'M')">
                  <xslt:value-of select="substring-before(substring-after($duration-time, 'M'), 'S')"/>
                </xslt:when>
                <xslt:when test="contains($duration-time, 'H')">
                  <xslt:value-of select="substring-before(substring-after($duration-time, 'H'), 'S')"/>
                </xslt:when>
                <xslt:otherwise>
                  <xslt:value-of select="substring-before($duration-time, 'S')"/>
                </xslt:otherwise>
              </xslt:choose>
            </xslt:when>
            <xslt:otherwise/>
          </xslt:choose>
        </xslt:otherwise>
      </xslt:choose>
    </xslt:variable>
    <xslt:choose>
      <xslt:when test="normalize-space($duration-component-value) = ''">0</xslt:when>
      <xslt:otherwise>
        <xslt:value-of select="$duration-component-value" disable-output-escaping="yes"/>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <xslt:template name="str:replace-string">
    <xslt:param name="text"/>
    <xslt:param name="from"/>
    <xslt:param name="to"/>
    <xslt:choose>
      <xslt:when test="contains($text, $from)">
        <xslt:variable name="before" select="substring-before($text, $from)"/>
        <xslt:variable name="after" select="substring-after($text, $from)"/>
        <xslt:variable name="prefix" select="concat($before, $to)"/>
        <xslt:value-of select="$before"/>
        <xslt:value-of select="$to"/>
        <xslt:call-template name="str:replace-string">
          <xslt:with-param name="text" select="$after"/>
          <xslt:with-param name="from" select="$from"/>
          <xslt:with-param name="to" select="$to"/>
        </xslt:call-template>
      </xslt:when>
      <xslt:otherwise>
        <xslt:value-of select="$text"/>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <!-- ========================= CUSTOM FORMATS ========================= -->
  <xslt:template name="str:custom-format">
    <xslt:param name="str" select="''"/>
    <xslt:param name="pattern" select="''"/>
    <xslt:param name="crtPos" select="1"/>
    <xslt:if test="$crtPos &lt;= string-length($pattern)">
      <xslt:variable name="chr" select="substring(normalize-space($pattern), $crtPos, 1)"/>
      <xslt:choose>
        <xslt:when test="$chr = '#'">
          <xslt:value-of select="substring($str, 1, 1)"/>
        </xslt:when>
        <xslt:otherwise>
          <xslt:value-of select="$chr"/>
        </xslt:otherwise>
      </xslt:choose>
      <xslt:call-template name="str:custom-format">
        <xslt:with-param name="str">
          <xslt:choose>
            <xslt:when test="$chr = '#'">
              <xslt:value-of select="substring($str, 2)"/>
            </xslt:when>
            <xslt:otherwise>
              <xslt:value-of select="$str"/>
            </xslt:otherwise>
          </xslt:choose>
        </xslt:with-param>
        <xslt:with-param name="pattern" select="$pattern"/>
        <xslt:with-param name="crtPos" select="$crtPos + 1"/>
      </xslt:call-template>
    </xslt:if>
  </xslt:template>
  <xslt:template name="str:get-number-ordinal">
    <xslt:param name="number"/>
    <xslt:param name="lang-id" select="'en_US'"/>
    <xslt:param name="type" select="'number'"/>
    <xslt:variable name="numberValue" select="number($number)"/>
    <xslt:choose>
      <xslt:when test="string($numberValue) = 'NaN'"/>
      <xslt:when test="$lang-id = 'en_US' or $lang-id = 'en_GB'">
        <xslt:choose>
          <xslt:when test="$numberValue = 11 or $numberValue = 12 or $numberValue = 13">
            <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;th&lt;/fo:inline&gt;</xslt:when>
          <xslt:when test="$numberValue mod 10 = 1">
            <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;st&lt;/fo:inline&gt;</xslt:when>
          <xslt:when test="$numberValue mod 10 = 2">
            <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;nd&lt;/fo:inline&gt;</xslt:when>
          <xslt:when test="$numberValue mod 10 = 3">
            <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;rd&lt;/fo:inline&gt;</xslt:when>
          <xslt:otherwise>
            <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;th&lt;/fo:inline&gt;</xslt:otherwise>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'da_DK'">
        <xslt:choose>
          <xslt:when test="$numberValue = 1">
            <xslt:value-of select="$numberValue"/>ste</xslt:when>
          <xslt:when test="$numberValue = 2">
            <xslt:value-of select="$numberValue"/>den</xslt:when>
          <xslt:when test="$numberValue = 3">
            <xslt:value-of select="$numberValue"/>je</xslt:when>
          <xslt:when test="$numberValue = 5 or $numberValue = 6 or $numberValue = 11 or $numberValue = 12">
            <xslt:value-of select="$numberValue"/>te</xslt:when>
          <xslt:otherwise>
            <xslt:value-of select="$numberValue"/>de</xslt:otherwise>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'fr_FR'">
        <xslt:choose>
          <xslt:when test="$numberValue = 1">
            <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;er&lt;/fo:inline&gt;</xslt:when>
          <xslt:otherwise>
            <xslt:choose>
              <xslt:when test="$type = 'number'">
                <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;e&lt;/fo:inline&gt;
              </xslt:when>
              <xslt:when test="$type = 'date'">
                <xslt:value-of select="$numberValue"/>
              </xslt:when>
              <xslt:otherwise>
                <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;e&lt;/fo:inline&gt;
              </xslt:otherwise>
            </xslt:choose>
          </xslt:otherwise>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'it_IT'">
        <xslt:choose>
          <xslt:when test="$numberValue = 1">
            <xslt:value-of select="$numberValue"/>&#186;</xslt:when>
          <xslt:otherwise>
            <xslt:choose>
              <xslt:when test="$type = 'number'">
                <xslt:value-of select="$numberValue"/>&#186;
              </xslt:when>
              <xslt:when test="$type = 'date'">
                <xslt:value-of select="$numberValue"/>
              </xslt:when>
              <xslt:otherwise>
                <xslt:value-of select="$numberValue"/>&#186;
              </xslt:otherwise>
            </xslt:choose>
          </xslt:otherwise>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'nl_NL'">
        <xslt:value-of select="$numberValue"/>&lt;fo:inline baseline-shift="super" font-size="smaller"&gt;e&lt;/fo:inline&gt;
      </xslt:when>
      <xslt:when test="$lang-id = 'es_ES'">
        <xslt:value-of select="$numberValue"/>&#186;
      </xslt:when>
      <xslt:otherwise>
        <xslt:value-of select="$numberValue"/>
        <xslt:text>.</xslt:text>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <!-- ========================= EXSLT TEMPLATES [str.padding.template.xsl] ========================= -->
  <xslt:template name="str:padding">
    <xslt:param name="length" select="0"/>
    <xslt:param name="chars" select="' '"/>
    <xslt:choose>
      <xslt:when test="not($length) or not($chars)"/>
      <xslt:otherwise>
        <xslt:variable name="string" select="concat($chars, $chars, $chars, $chars, $chars,                                        $chars, $chars, $chars, $chars, $chars)"/>
        <xslt:choose>
          <xslt:when test="string-length($string) &gt;= $length">
            <xslt:value-of select="substring($string, 1, $length)"/>
          </xslt:when>
          <xslt:otherwise>
            <xslt:call-template name="str:padding">
              <xslt:with-param name="length" select="$length"/>
              <xslt:with-param name="chars" select="$string"/>
            </xslt:call-template>
          </xslt:otherwise>
        </xslt:choose>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <!-- ========================= EXSLT TEMPLATES [date.format-date.template.xsl] ========================= -->
  <xslt:template name="date:_get-days-elapsed">
    <xslt:param name="month"/>
    <xslt:choose>
      <xslt:when test="$month = 1">0</xslt:when>
      <xslt:when test="$month = 2">31</xslt:when>
      <xslt:when test="$month = 3">59</xslt:when>
      <xslt:when test="$month = 4">90</xslt:when>
      <xslt:when test="$month = 5">120</xslt:when>
      <xslt:when test="$month = 6">151</xslt:when>
      <xslt:when test="$month = 7">181</xslt:when>
      <xslt:when test="$month = 8">212</xslt:when>
      <xslt:when test="$month = 9">243</xslt:when>
      <xslt:when test="$month = 10">273</xslt:when>
      <xslt:when test="$month = 11">304</xslt:when>
      <xslt:when test="$month = 12">334</xslt:when>
      <xslt:otherwise>365</xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <xslt:template name="date:_get-month">
    <xslt:param name="month"/>
    <xslt:param name="lang-id" select="'en_US'"/>
    <xslt:choose>
      <xslt:when test="$lang-id = 'fr_FR'">
        <xslt:choose>
          <xslt:when test="$month = 1">janvier;jan</xslt:when>
          <xslt:when test="$month = 2">f&#233;vrier;f&#233;v</xslt:when>
          <xslt:when test="$month = 3">mars;mar</xslt:when>
          <xslt:when test="$month = 4">avril;avr</xslt:when>
          <xslt:when test="$month = 5">mai;mai</xslt:when>
          <xslt:when test="$month = 6">juin;jui</xslt:when>
          <xslt:when test="$month = 7">juillet;juil</xslt:when>
          <xslt:when test="$month = 8">ao&#251;t;ao&#251;</xslt:when>
          <xslt:when test="$month = 9">septembre;sep</xslt:when>
          <xslt:when test="$month = 10">octobre;oct</xslt:when>
          <xslt:when test="$month = 11">novembre;nov</xslt:when>
          <xslt:when test="$month = 12">d&#233;cembre;d&#233;c</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'de_AT' or $lang-id = 'de_DE' or $lang-id = 'de_CH'">
        <xslt:choose>
          <xslt:when test="$month = 1">Januar;Jan</xslt:when>
          <xslt:when test="$month = 2">Februar;Feb</xslt:when>
          <xslt:when test="$month = 3">M&#228;rz;M&#228;r</xslt:when>
          <xslt:when test="$month = 4">April;Apr</xslt:when>
          <xslt:when test="$month = 5">Mai;Mai</xslt:when>
          <xslt:when test="$month = 6">Juni;Jun</xslt:when>
          <xslt:when test="$month = 7">Juli;Jul</xslt:when>
          <xslt:when test="$month = 8">August;Aug</xslt:when>
          <xslt:when test="$month = 9">September;Sep</xslt:when>
          <xslt:when test="$month = 10">Oktober;Okt</xslt:when>
          <xslt:when test="$month = 11">November;Nov</xslt:when>
          <xslt:when test="$month = 12">Dezember;Dez</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'es_ES'">
        <xslt:choose>
          <xslt:when test="$month = 1">Enero;Ene</xslt:when>
          <xslt:when test="$month = 2">Febrero;Feb</xslt:when>
          <xslt:when test="$month = 3">Marzo;Mar</xslt:when>
          <xslt:when test="$month = 4">Abril;Abr</xslt:when>
          <xslt:when test="$month = 5">Mayo;May</xslt:when>
          <xslt:when test="$month = 6">Junio;Jun</xslt:when>
          <xslt:when test="$month = 7">Julio;Jul</xslt:when>
          <xslt:when test="$month = 8">Agosto;Ago</xslt:when>
          <xslt:when test="$month = 9">Septiembre;Sep</xslt:when>
          <xslt:when test="$month = 10">Octubre;Oct</xslt:when>
          <xslt:when test="$month = 11">Noviembre;Nov</xslt:when>
          <xslt:when test="$month = 12">Diciembre;Dic</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'nl_NL'">
        <xslt:choose>
          <xslt:when test="$month = 1">januari;jan</xslt:when>
          <xslt:when test="$month = 2">februari;feb</xslt:when>
          <xslt:when test="$month = 3">maart;maa</xslt:when>
          <xslt:when test="$month = 4">april;apr</xslt:when>
          <xslt:when test="$month = 5">mei;mei</xslt:when>
          <xslt:when test="$month = 6">juni;jun</xslt:when>
          <xslt:when test="$month = 7">juli;jul</xslt:when>
          <xslt:when test="$month = 8">augustus;aug</xslt:when>
          <xslt:when test="$month = 9">september;sep</xslt:when>
          <xslt:when test="$month = 10">oktober;okt</xslt:when>
          <xslt:when test="$month = 11">november;nov</xslt:when>
          <xslt:when test="$month = 12">december;dec</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'it_IT'">
        <xslt:choose>
          <xslt:when test="$month = 1">gennaio;genn</xslt:when>
          <xslt:when test="$month = 2">febbraio;febbr</xslt:when>
          <xslt:when test="$month = 3">marzo;mar</xslt:when>
          <xslt:when test="$month = 4">aprile;apr</xslt:when>
          <xslt:when test="$month = 5">maggio;magg</xslt:when>
          <xslt:when test="$month = 6">giugno;giugno</xslt:when>
          <xslt:when test="$month = 7">luglio;luglio</xslt:when>
          <xslt:when test="$month = 8">agosto;ag</xslt:when>
          <xslt:when test="$month = 9">settembre;sett</xslt:when>
          <xslt:when test="$month = 10">ottobre;ott</xslt:when>
          <xslt:when test="$month = 11">novembre;nov</xslt:when>
          <xslt:when test="$month = 12">dicembre;dic</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'da_DK'">
        <xslt:choose>
          <xslt:when test="$month = 1">januar;jan</xslt:when>
          <xslt:when test="$month = 2">februar;feb</xslt:when>
          <xslt:when test="$month = 3">marts;mar</xslt:when>
          <xslt:when test="$month = 4">april;apr</xslt:when>
          <xslt:when test="$month = 5">maj;maj</xslt:when>
          <xslt:when test="$month = 6">juni;jun</xslt:when>
          <xslt:when test="$month = 7">juli;jul</xslt:when>
          <xslt:when test="$month = 8">august;aug</xslt:when>
          <xslt:when test="$month = 9">september;sep</xslt:when>
          <xslt:when test="$month = 10">oktober;okt</xslt:when>
          <xslt:when test="$month = 11">november;nov</xslt:when>
          <xslt:when test="$month = 12">december;dec</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:otherwise>
        <xslt:choose>
          <xslt:when test="$month = 1">January;Jan</xslt:when>
          <xslt:when test="$month = 2">February;Feb</xslt:when>
          <xslt:when test="$month = 3">March;Mar</xslt:when>
          <xslt:when test="$month = 4">April;Apr</xslt:when>
          <xslt:when test="$month = 5">May;May</xslt:when>
          <xslt:when test="$month = 6">June;Jun</xslt:when>
          <xslt:when test="$month = 7">July;Jul</xslt:when>
          <xslt:when test="$month = 8">August;Aug</xslt:when>
          <xslt:when test="$month = 9">September;Sep</xslt:when>
          <xslt:when test="$month = 10">October;Oct</xslt:when>
          <xslt:when test="$month = 11">November;Nov</xslt:when>
          <xslt:when test="$month = 12">December;Dec</xslt:when>
        </xslt:choose>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <xslt:template name="date:_get-day">
    <xslt:param name="day"/>
    <xslt:param name="lang-id" select="'en_US'"/>
    <xslt:choose>
      <xslt:when test="$lang-id = 'fr_FR'">
        <xslt:choose>
          <xslt:when test="$day = 1">Dimanche;Dim</xslt:when>
          <xslt:when test="$day = 2">Lundi;Lun</xslt:when>
          <xslt:when test="$day = 3">Mardi;Mar</xslt:when>
          <xslt:when test="$day = 4">Mercredi;Mer</xslt:when>
          <xslt:when test="$day = 5">Jeudi;Jeu</xslt:when>
          <xslt:when test="$day = 6">Vendredi;Ven</xslt:when>
          <xslt:when test="$day = 7">Samedi;Sam</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'de_AT' or $lang-id = 'de_DE' or $lang-id = 'de_CH'">
        <xslt:choose>
          <xslt:when test="$day = 1">Sonntag;Son</xslt:when>
          <xslt:when test="$day = 2">Montag;Mon</xslt:when>
          <xslt:when test="$day = 3">Dienstag;Die</xslt:when>
          <xslt:when test="$day = 4">Mittwoch;Mit</xslt:when>
          <xslt:when test="$day = 5">Donnerstag;Don</xslt:when>
          <xslt:when test="$day = 6">Freitag;Fre</xslt:when>
          <xslt:when test="$day = 7">Samstag;Sam</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'es_ES'">
        <xslt:choose>
          <xslt:when test="$day = 1">Domingo;Dom</xslt:when>
          <xslt:when test="$day = 2">Lunes;Lun</xslt:when>
          <xslt:when test="$day = 3">Martes;Mar</xslt:when>
          <xslt:when test="$day = 4">Mi&#233;rcoles;Mi&#233;</xslt:when>
          <xslt:when test="$day = 5">Jueves;Jue</xslt:when>
          <xslt:when test="$day = 6">Viernes;Vie</xslt:when>
          <xslt:when test="$day = 7">S&#225;bado;S&#225;b</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'nl_NL'">
        <xslt:choose>
          <xslt:when test="$day = 1">zondag;zon</xslt:when>
          <xslt:when test="$day = 2">maandag;maa</xslt:when>
          <xslt:when test="$day = 3">dinsdag;din</xslt:when>
          <xslt:when test="$day = 4">woensdag;woe</xslt:when>
          <xslt:when test="$day = 5">donderdag;don</xslt:when>
          <xslt:when test="$day = 6">vrijdag;vri</xslt:when>
          <xslt:when test="$day = 7">zaterdag;zat</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'it_IT'">
        <xslt:choose>
          <xslt:when test="$day = 1">domenica;do</xslt:when>
          <xslt:when test="$day = 2">luned&#236;;lun</xslt:when>
          <xslt:when test="$day = 3">marted&#236;;mar</xslt:when>
          <xslt:when test="$day = 4">mercoled&#236;;mer</xslt:when>
          <xslt:when test="$day = 5">gioved&#236;;gio</xslt:when>
          <xslt:when test="$day = 6">venerd&#236;;ven</xslt:when>
          <xslt:when test="$day = 7">sabato;sab</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="$lang-id = 'da_DK'">
        <xslt:choose>
          <xslt:when test="$day = 1">s&#248;ndag;s&#248;n</xslt:when>
          <xslt:when test="$day = 2">mandag;man</xslt:when>
          <xslt:when test="$day = 3">tirsdag;tir</xslt:when>
          <xslt:when test="$day = 4">onsdag;ons</xslt:when>
          <xslt:when test="$day = 5">torsdag;tor</xslt:when>
          <xslt:when test="$day = 6">fredag;fre</xslt:when>
          <xslt:when test="$day = 7">l&#248;rdag;l&#248;r</xslt:when>
        </xslt:choose>
      </xslt:when>
      <xslt:otherwise>
        <xslt:choose>
          <xslt:when test="$day = 1">Sunday;Sun</xslt:when>
          <xslt:when test="$day = 2">Monday;Mon</xslt:when>
          <xslt:when test="$day = 3">Tuesday;Tue</xslt:when>
          <xslt:when test="$day = 4">Wednesday;Wed</xslt:when>
          <xslt:when test="$day = 5">Thursday;Thu</xslt:when>
          <xslt:when test="$day = 6">Friday;Fri</xslt:when>
          <xslt:when test="$day = 7">Saturday;Sat</xslt:when>
        </xslt:choose>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <xslt:template name="date:format-date">
    <xslt:param name="date-time"/>
    <xslt:param name="pattern"/>
    <xslt:param name="lang-id"/>
    <xslt:variable name="formatted">
      <xslt:choose>
        <xslt:when test="starts-with($date-time, '---')">
          <xslt:call-template name="date:_format-date">
            <xslt:with-param name="year" select="'NaN'"/>
            <xslt:with-param name="month" select="'NaN'"/>
            <xslt:with-param name="day" select="number(substring($date-time, 4, 2))"/>
            <xslt:with-param name="pattern" select="$pattern"/>
            <xslt:with-param name="lang-id" select="$lang-id"/>
          </xslt:call-template>
        </xslt:when>
        <xslt:when test="starts-with($date-time, '--')">
          <xslt:call-template name="date:_format-date">
            <xslt:with-param name="year" select="'NaN'"/>
            <xslt:with-param name="month" select="number(substring($date-time, 3, 2))"/>
            <xslt:with-param name="day" select="number(substring($date-time, 6, 2))"/>
            <xslt:with-param name="pattern" select="$pattern"/>
            <xslt:with-param name="lang-id" select="$lang-id"/>
          </xslt:call-template>
        </xslt:when>
        <xslt:otherwise>
          <xslt:variable name="neg" select="starts-with($date-time, '-')"/>
          <xslt:variable name="no-neg">
            <xslt:choose>
              <xslt:when test="$neg or starts-with($date-time, '+')">
                <xslt:value-of select="substring($date-time, 2)"/>
              </xslt:when>
              <xslt:otherwise>
                <xslt:value-of select="$date-time"/>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:variable>
          <xslt:variable name="no-neg-length" select="string-length($no-neg)"/>
          <xslt:variable name="timezone">
            <xslt:choose>
              <xslt:when test="substring($no-neg, $no-neg-length) = 'Z'">Z</xslt:when>
              <xslt:otherwise>
                <xslt:variable name="tz" select="substring($no-neg, $no-neg-length - 5)"/>
                <xslt:if test="(substring($tz, 1, 1) = '-' or                                      substring($tz, 1, 1) = '+') and                                    substring($tz, 4, 1) = ':'">
                  <xslt:value-of select="$tz"/>
                </xslt:if>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:variable>
          <xslt:if test="not(string($timezone)) or                           $timezone = 'Z' or                            (substring($timezone, 2, 2) &lt;= 23 and                            substring($timezone, 5, 2) &lt;= 59)">
            <xslt:variable name="dt" select="substring($no-neg, 1, $no-neg-length - string-length($timezone))"/>
            <xslt:variable name="dt-length" select="string-length($dt)"/>
            <xslt:choose>
              <xslt:when test="substring($dt, 3, 1) = ':' and                                   substring($dt, 6, 1) = ':'">
                <xslt:variable name="hour" select="substring($dt, 1, 2)"/>
                <xslt:variable name="min" select="substring($dt, 4, 2)"/>
                <xslt:variable name="sec" select="substring($dt, 7)"/>
                <xslt:if test="$hour &lt;= 23 and                                    $min &lt;= 59 and                                    $sec &lt;= 60">
                  <xslt:call-template name="date:_format-date">
                    <xslt:with-param name="year" select="'NaN'"/>
                    <xslt:with-param name="month" select="'NaN'"/>
                    <xslt:with-param name="day" select="'NaN'"/>
                    <xslt:with-param name="hour" select="$hour"/>
                    <xslt:with-param name="minute" select="$min"/>
                    <xslt:with-param name="second" select="$sec"/>
                    <xslt:with-param name="timezone" select="$timezone"/>
                    <xslt:with-param name="pattern" select="$pattern"/>
                    <xslt:with-param name="lang-id" select="$lang-id"/>
                  </xslt:call-template>
                </xslt:if>
              </xslt:when>
              <xslt:otherwise>
                <xslt:variable name="year" select="substring($dt, 1, 4) * (($neg * -2) + 1)"/>
                <xslt:choose>
                  <xslt:when test="not(number($year))"/>
                  <xslt:when test="$dt-length = 4">
                    <xslt:call-template name="date:_format-date">
                      <xslt:with-param name="year" select="$year"/>
                      <xslt:with-param name="timezone" select="$timezone"/>
                      <xslt:with-param name="pattern" select="$pattern"/>
                      <xslt:with-param name="lang-id" select="$lang-id"/>
                    </xslt:call-template>
                  </xslt:when>
                  <xslt:when test="substring($dt, 5, 1) = '-'">
                    <xslt:variable name="month" select="substring($dt, 6, 2)"/>
                    <xslt:choose>
                      <xslt:when test="not($month &lt;= 12)"/>
                      <xslt:when test="$dt-length = 7">
                        <xslt:call-template name="date:_format-date">
                          <xslt:with-param name="year" select="$year"/>
                          <xslt:with-param name="month" select="$month"/>
                          <xslt:with-param name="timezone" select="$timezone"/>
                          <xslt:with-param name="pattern" select="$pattern"/>
                          <xslt:with-param name="lang-id" select="$lang-id"/>
                        </xslt:call-template>
                      </xslt:when>
                      <xslt:when test="substring($dt, 8, 1) = '-'">
                        <xslt:variable name="day" select="substring($dt, 9, 2)"/>
                        <xslt:if test="$day &lt;= 31">
                          <xslt:choose>
                            <xslt:when test="$dt-length = 10">
                              <xslt:call-template name="date:_format-date">
                                <xslt:with-param name="year" select="$year"/>
                                <xslt:with-param name="month" select="$month"/>
                                <xslt:with-param name="day" select="$day"/>
                                <xslt:with-param name="timezone" select="$timezone"/>
                                <xslt:with-param name="pattern" select="$pattern"/>
                                <xslt:with-param name="lang-id" select="$lang-id"/>
                              </xslt:call-template>
                            </xslt:when>
                            <xslt:when test="substring($dt, 11, 1) = 'T' and                                                        substring($dt, 14, 1) = ':' and                                                        substring($dt, 17, 1) = ':'">
                              <xslt:variable name="hour" select="substring($dt, 12, 2)"/>
                              <xslt:variable name="min" select="substring($dt, 15, 2)"/>
                              <xslt:variable name="sec" select="substring($dt, 18)"/>
                              <xslt:if test="$hour &lt;= 23 and                                                         $min &lt;= 59 and                                                         $sec &lt;= 60">
                                <xslt:call-template name="date:_format-date">
                                  <xslt:with-param name="year" select="$year"/>
                                  <xslt:with-param name="month" select="$month"/>
                                  <xslt:with-param name="day" select="$day"/>
                                  <xslt:with-param name="hour" select="$hour"/>
                                  <xslt:with-param name="minute" select="$min"/>
                                  <xslt:with-param name="second" select="$sec"/>
                                  <xslt:with-param name="timezone" select="$timezone"/>
                                  <xslt:with-param name="pattern" select="$pattern"/>
                                  <xslt:with-param name="lang-id" select="$lang-id"/>
                                </xslt:call-template>
                              </xslt:if>
                            </xslt:when>
                          </xslt:choose>
                        </xslt:if>
                      </xslt:when>
                    </xslt:choose>
                  </xslt:when>
                  <xslt:when test="string(number(substring($dt,5,1)))!='NaN'">
                    <xslt:variable name="month" select="substring($dt, 5, 2)"/>
                    <xslt:choose>
                      <xslt:when test="not($month &lt;= 12)"/>
                      <xslt:when test="$dt-length = 6">
                        <xslt:call-template name="date:_format-date">
                          <xslt:with-param name="year" select="$year"/>
                          <xslt:with-param name="month" select="$month"/>
                          <xslt:with-param name="timezone" select="$timezone"/>
                          <xslt:with-param name="pattern" select="$pattern"/>
                          <xslt:with-param name="lang-id" select="$lang-id"/>
                        </xslt:call-template>
                      </xslt:when>
                      <xslt:otherwise>
                        <xslt:variable name="day" select="substring($dt, 7, 2)"/>
                        <xslt:if test="$day &lt;= 31">
                          <xslt:choose>
                            <xslt:when test="$dt-length = 8">
                              <xslt:call-template name="date:_format-date">
                                <xslt:with-param name="year" select="$year"/>
                                <xslt:with-param name="month" select="$month"/>
                                <xslt:with-param name="day" select="$day"/>
                                <xslt:with-param name="timezone" select="$timezone"/>
                                <xslt:with-param name="pattern" select="$pattern"/>
                                <xslt:with-param name="lang-id" select="$lang-id"/>
                              </xslt:call-template>
                            </xslt:when>
                            <xslt:when test="substring($dt, 9, 1) = 'T' and  substring($dt, 12, 1) = ':' and  substring($dt, 15, 1) = ':'">
                              <xslt:variable name="hour" select="substring($dt, 10, 2)"/>
                              <xslt:variable name="min" select="substring($dt, 13, 2)"/>
                              <xslt:variable name="sec" select="substring($dt, 16)"/>
                              <xslt:if test="$hour &lt;= 23 and                                                         $min &lt;= 59 and                                                         $sec &lt;= 60">
                                <xslt:call-template name="date:_format-date">
                                  <xslt:with-param name="year" select="$year"/>
                                  <xslt:with-param name="month" select="$month"/>
                                  <xslt:with-param name="day" select="$day"/>
                                  <xslt:with-param name="hour" select="$hour"/>
                                  <xslt:with-param name="minute" select="$min"/>
                                  <xslt:with-param name="second" select="$sec"/>
                                  <xslt:with-param name="timezone" select="$timezone"/>
                                  <xslt:with-param name="pattern" select="$pattern"/>
                                  <xslt:with-param name="lang-id" select="$lang-id"/>
                                </xslt:call-template>
                              </xslt:if>
                            </xslt:when>
                          </xslt:choose>
                        </xslt:if>
                      </xslt:otherwise>
                    </xslt:choose>
                  </xslt:when>
                </xslt:choose>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:if>
        </xslt:otherwise>
      </xslt:choose>
    </xslt:variable>
    <xslt:value-of select="$formatted" disable-output-escaping="yes"/>
  </xslt:template>
  <xslt:template name="date:_format-date">
    <xslt:param name="year"/>
    <xslt:param name="month" select="1"/>
    <xslt:param name="day" select="1"/>
    <xslt:param name="hour" select="0"/>
    <xslt:param name="minute" select="0"/>
    <xslt:param name="second" select="0"/>
    <xslt:param name="timezone" select="'Z'"/>
    <xslt:param name="pattern" select="''"/>
    <xslt:param name="lang-id" select="'en_US'"/>
    <xslt:variable name="char" select="substring($pattern, 1, 1)"/>
    <xslt:choose>
      <xslt:when test="not($pattern)"/>
      <xslt:when test="$char = &quot;'&quot;">
        <xslt:choose>
          <xslt:when test="substring($pattern, 2, 1) = &quot;'&quot;">
            <xslt:text>'</xslt:text>
            <xslt:call-template name="date:_format-date">
              <xslt:with-param name="year" select="$year"/>
              <xslt:with-param name="month" select="$month"/>
              <xslt:with-param name="day" select="$day"/>
              <xslt:with-param name="hour" select="$hour"/>
              <xslt:with-param name="minute" select="$minute"/>
              <xslt:with-param name="second" select="$second"/>
              <xslt:with-param name="timezone" select="$timezone"/>
              <xslt:with-param name="pattern" select="substring($pattern, 3)"/>
              <xslt:with-param name="lang-id" select="$lang-id"/>
            </xslt:call-template>
          </xslt:when>
          <xslt:otherwise>
            <xslt:variable name="literal-value" select="substring-before(substring($pattern, 2), &quot;'&quot;)"/>
            <xslt:value-of select="$literal-value"/>
            <xslt:call-template name="date:_format-date">
              <xslt:with-param name="year" select="$year"/>
              <xslt:with-param name="month" select="$month"/>
              <xslt:with-param name="day" select="$day"/>
              <xslt:with-param name="hour" select="$hour"/>
              <xslt:with-param name="minute" select="$minute"/>
              <xslt:with-param name="second" select="$second"/>
              <xslt:with-param name="timezone" select="$timezone"/>
              <xslt:with-param name="pattern" select="substring($pattern, string-length($literal-value) + 2)"/>
              <xslt:with-param name="lang-id" select="$lang-id"/>
            </xslt:call-template>
          </xslt:otherwise>
        </xslt:choose>
      </xslt:when>
      <xslt:when test="not(contains('abcdefghjiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', $char))">
        <xslt:value-of select="$char"/>
        <xslt:call-template name="date:_format-date">
          <xslt:with-param name="year" select="$year"/>
          <xslt:with-param name="month" select="$month"/>
          <xslt:with-param name="day" select="$day"/>
          <xslt:with-param name="hour" select="$hour"/>
          <xslt:with-param name="minute" select="$minute"/>
          <xslt:with-param name="second" select="$second"/>
          <xslt:with-param name="timezone" select="$timezone"/>
          <xslt:with-param name="pattern" select="substring($pattern, 2)"/>
          <xslt:with-param name="lang-id" select="$lang-id"/>
        </xslt:call-template>
      </xslt:when>
      <xslt:when test="not(contains('GyMdhHmsSEDFOwWakKz', $char))">
        <xslt:message>
          Invalid token in format string: <xslt:value-of select="$char"/>
        </xslt:message>
        <xslt:call-template name="date:_format-date">
          <xslt:with-param name="year" select="$year"/>
          <xslt:with-param name="month" select="$month"/>
          <xslt:with-param name="day" select="$day"/>
          <xslt:with-param name="hour" select="$hour"/>
          <xslt:with-param name="minute" select="$minute"/>
          <xslt:with-param name="second" select="$second"/>
          <xslt:with-param name="timezone" select="$timezone"/>
          <xslt:with-param name="pattern" select="substring($pattern, 2)"/>
          <xslt:with-param name="lang-id" select="$lang-id"/>
        </xslt:call-template>
      </xslt:when>
      <xslt:otherwise>
        <xslt:variable name="next-different-char" select="substring(translate($pattern, $char, ''), 1, 1)"/>
        <xslt:variable name="pattern-length">
          <xslt:choose>
            <xslt:when test="$next-different-char">
              <xslt:value-of select="string-length(substring-before($pattern, $next-different-char))"/>
            </xslt:when>
            <xslt:otherwise>
              <xslt:value-of select="string-length($pattern)"/>
            </xslt:otherwise>
          </xslt:choose>
        </xslt:variable>
        <xslt:choose>
          <xslt:when test="$char = 'G'">
            <xslt:choose>
              <xslt:when test="string($year) = 'NaN'"/>
              <xslt:when test="$year &gt; 0">AD</xslt:when>
              <xslt:otherwise>BC</xslt:otherwise>
            </xslt:choose>
          </xslt:when>
          <xslt:when test="$char = 'M'">
            <xslt:choose>
              <xslt:when test="string($month) = 'NaN'"/>
              <xslt:when test="$pattern-length &gt;= 3">
                <xslt:variable name="month-node">
                  <xslt:call-template name="date:_get-month">
                    <xslt:with-param name="month" select="number($month)"/>
                    <xslt:with-param name="lang-id" select="$lang-id"/>
                  </xslt:call-template>
                </xslt:variable>
                <xslt:choose>
                  <xslt:when test="$pattern-length &gt;= 4">
                    <xslt:value-of select="substring-before(normalize-space($month-node), ';')"/>
                  </xslt:when>
                  <xslt:otherwise>
                    <xslt:value-of select="substring-after(normalize-space($month-node), ';')"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$pattern-length = 2">
                <xslt:value-of select="format-number($month, '00')"/>
              </xslt:when>
              <xslt:when test="$pattern-length = 1">
                <xslt:value-of select="format-number($month, '0')"/>
              </xslt:when>
              <xslt:otherwise>
                <xslt:value-of select="$month"/>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:when>
          <xslt:when test="$char = 'E'">
            <xslt:choose>
              <xslt:when test="string($year) = 'NaN' or string($month) = 'NaN' or string($day) = 'NaN'"/>
              <xslt:otherwise>
                <xslt:variable name="month-days">
                  <xslt:call-template name="date:_get-days-elapsed">
                    <xslt:with-param name="month" select="number($month)"/>
                  </xslt:call-template>
                </xslt:variable>
                <xslt:variable name="days" select="number($month-days) + $day + boolean(((not($year mod 4) and $year mod 100) or not($year mod 400)) and $month &gt; 2)"/>
                <xslt:variable name="y-1" select="$year - 1"/>
                <xslt:variable name="dow" select="(($y-1 + floor($y-1 div 4) -                                              floor($y-1 div 100) + floor($y-1 div 400) +                                              $days)                                              mod 7) + 1"/>
                <xslt:variable name="day-node">
                  <xslt:call-template name="date:_get-day">
                    <xslt:with-param name="day" select="number($dow)"/>
                    <xslt:with-param name="lang-id" select="$lang-id"/>
                  </xslt:call-template>
                </xslt:variable>
                <xslt:choose>
                  <xslt:when test="$pattern-length &gt;= 4">
                    <xslt:value-of select="substring-before(normalize-space($day-node),';')"/>
                  </xslt:when>
                  <xslt:otherwise>
                    <xslt:value-of select="substring-after(normalize-space($day-node),';')"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:when>
          <xslt:when test="$char = 'a'">
            <xslt:choose>
              <xslt:when test="string($hour) = 'NaN'"/>
              <xslt:when test="$hour &gt;= 12">PM</xslt:when>
              <xslt:otherwise>AM</xslt:otherwise>
            </xslt:choose>
          </xslt:when>
          <xslt:when test="$char = 'z'">
            <xslt:choose>
              <xslt:when test="$timezone = 'Z'">UTC</xslt:when>
              <xslt:otherwise>
                UTC<xslt:value-of select="$timezone"/>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:when>
          <xslt:otherwise>
            <xslt:variable name="padding">
              <xslt:choose>
                <xslt:when test="$pattern-length &gt; 10">
                  <xslt:call-template name="str:padding">
                    <xslt:with-param name="length" select="$pattern-length"/>
                    <xslt:with-param name="chars" select="'0'"/>
                  </xslt:call-template>
                </xslt:when>
                <xslt:otherwise>
                  <xslt:value-of select="substring('0000000000', 1, $pattern-length)"/>
                </xslt:otherwise>
              </xslt:choose>
            </xslt:variable>
            <xslt:choose>
              <xslt:when test="$char = 'O'">
                <xslt:choose>
                  <xslt:when test="string($day) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:variable name="day-ordinal">
                      <xslt:call-template name="str:get-number-ordinal">
                        <xslt:with-param name="number" select="$day"/>
                        <xslt:with-param name="lang-id" select="$lang-id"/>
                        <xslt:with-param name="type" select="'date'"/>
                      </xslt:call-template>
                    </xslt:variable>
                    <xslt:value-of select="$day-ordinal"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'y'">
                <xslt:choose>
                  <xslt:when test="string($year) = 'NaN'"/>
                  <xslt:when test="$pattern-length &gt; 2">
                    <xslt:value-of select="format-number($year, $padding)"/>
                  </xslt:when>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number(substring($year, string-length($year) - 1), $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'd'">
                <xslt:choose>
                  <xslt:when test="string($day) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number($day, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'h'">
                <xslt:variable name="h" select="$hour mod 12"/>
                <xslt:choose>
                  <xslt:when test="string($hour) = 'NaN'"/>
                  <xslt:when test="$h">
                    <xslt:value-of select="format-number($h, $padding)"/>
                  </xslt:when>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number(12, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'H'">
                <xslt:choose>
                  <xslt:when test="string($hour) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number($hour, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'k'">
                <xslt:choose>
                  <xslt:when test="string($hour) = 'NaN'"/>
                  <xslt:when test="$hour">
                    <xslt:value-of select="format-number($hour, $padding)"/>
                  </xslt:when>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number(24, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'K'">
                <xslt:choose>
                  <xslt:when test="string($hour) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number($hour mod 12, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'm'">
                <xslt:choose>
                  <xslt:when test="string($minute) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number($minute, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 's'">
                <xslt:choose>
                  <xslt:when test="string($second) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number($second, $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'S'">
                <xslt:choose>
                  <xslt:when test="string($second) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="format-number(substring-after($second, '.'), $padding)"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="$char = 'F'">
                <xslt:choose>
                  <xslt:when test="string($day) = 'NaN'"/>
                  <xslt:otherwise>
                    <xslt:value-of select="floor($day div 7) + 1"/>
                  </xslt:otherwise>
                </xslt:choose>
              </xslt:when>
              <xslt:when test="string($year) = 'NaN' or string($month) = 'NaN' or string($day) = 'NaN'"/>
              <xslt:otherwise>
                <xslt:variable name="month-days">
                  <xslt:call-template name="date:_get-days-elapsed">
                    <xslt:with-param name="month" select="number($month)"/>
                  </xslt:call-template>
                </xslt:variable>
                <xslt:variable name="days" select="number($month-days) + $day + boolean(((not($year mod 4) and $year mod 100) or not($year mod 400)) and $month &gt; 2)"/>
                <xslt:choose>
                  <xslt:when test="$char = 'D'">
                    <xslt:value-of select="format-number($days, $padding)"/>
                  </xslt:when>
                  <xslt:when test="$char = 'w'">
                    <xslt:call-template name="date:_week-in-year">
                      <xslt:with-param name="days" select="$days"/>
                      <xslt:with-param name="year" select="$year"/>
                    </xslt:call-template>
                  </xslt:when>
                  <xslt:when test="$char = 'W'">
                    <xslt:variable name="y-1" select="$year - 1"/>
                    <xslt:variable name="day-of-week" select="(($y-1 + floor($y-1 div 4) -                                                   floor($y-1 div 100) + floor($y-1 div 400) +                                                   $days)                                                    mod 7) + 1"/>
                    <xslt:choose>
                      <xslt:when test="($day - $day-of-week) mod 7">
                        <xslt:value-of select="floor(($day - $day-of-week) div 7) + 2"/>
                      </xslt:when>
                      <xslt:otherwise>
                        <xslt:value-of select="floor(($day - $day-of-week) div 7) + 1"/>
                      </xslt:otherwise>
                    </xslt:choose>
                  </xslt:when>
                </xslt:choose>
              </xslt:otherwise>
            </xslt:choose>
          </xslt:otherwise>
        </xslt:choose>
        <xslt:call-template name="date:_format-date">
          <xslt:with-param name="year" select="$year"/>
          <xslt:with-param name="month" select="$month"/>
          <xslt:with-param name="day" select="$day"/>
          <xslt:with-param name="hour" select="$hour"/>
          <xslt:with-param name="minute" select="$minute"/>
          <xslt:with-param name="second" select="$second"/>
          <xslt:with-param name="timezone" select="$timezone"/>
          <xslt:with-param name="pattern" select="substring($pattern, $pattern-length + 1)"/>
          <xslt:with-param name="lang-id" select="$lang-id"/>
        </xslt:call-template>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>
  <xslt:template name="date:_week-in-year">
    <xslt:param name="days"/>
    <xslt:param name="year"/>
    <xslt:variable name="y-1" select="$year - 1"/>
    <xslt:variable name="day-of-week" select="($y-1 + floor($y-1 div 4) -                           floor($y-1 div 100) + floor($y-1 div 400) +                           $days)                           mod 7"/>
    <xslt:variable name="dow">
      <xslt:choose>
        <xslt:when test="$day-of-week">
          <xslt:value-of select="$day-of-week"/>
        </xslt:when>
        <xslt:otherwise>7</xslt:otherwise>
      </xslt:choose>
    </xslt:variable>
    <xslt:variable name="start-day" select="($days - $dow + 7) mod 7"/>
    <xslt:variable name="week-number" select="floor(($days - $dow + 7) div 7)"/>
    <xslt:choose>
      <xslt:when test="$start-day &gt;= 4">
        <xslt:value-of select="$week-number + 1"/>
      </xslt:when>
      <xslt:otherwise>
        <xslt:choose>
          <xslt:when test="not($week-number)">
            <xslt:call-template name="date:_week-in-year">
              <xslt:with-param name="days" select="365 + ((not($y-1 mod 4) and $y-1 mod 100) or not($y-1 mod 400))"/>
              <xslt:with-param name="year" select="$y-1"/>
            </xslt:call-template>
          </xslt:when>
          <xslt:otherwise>
            <xslt:value-of select="$week-number"/>
          </xslt:otherwise>
        </xslt:choose>
      </xslt:otherwise>
    </xslt:choose>
  </xslt:template>

<!--My code-->
  <xsl:template match="datetime">
    <xsl:copy>
        <xsl:call-template name="date:UTC-corrected">
            <xsl:with-param name="dateTime" select="."/>
        </xsl:call-template>
    </xsl:copy>
</xsl:template> 

  <xsl:template name="date:UTC-corrected">
    <xsl:param name="dateTime"/>

    <xsl:variable name="date" select="substring-before($dateTime, 'T')" />
    <xsl:variable name="time" select="substring-before(substring-after($dateTime, 'T'), 'Z')" />

    <xsl:variable name="year" select="substring($date, 1, 4)" />
    <xsl:variable name="month" select="substring($date, 6, 2)" />
    <xsl:variable name="day" select="substring($date, 9, 2)" />

    <xsl:variable name="hour" select="substring($time, 1, 2)" />
    <xsl:variable name="minute" select="substring($time, 4, 2)" />
    <xsl:variable name="second" select="substring($time, 7)" />

    <xsl:variable name="a" select="floor((14 - $month) div 12)"/>
    <xsl:variable name="y" select="$year + 4800 - $a"/>
    <xsl:variable name="m" select="$month + 12*$a - 3"/>    
    <xsl:variable name="jd" select="$day + floor((153*$m + 2) div 5) + 365*$y + floor($y div 4) - floor($y div 100) + floor($y div 400) - 32045" />

    <xsl:variable name="total-seconds" select="86400*$jd + 3600*$hour + 60*$minute + $second - 25200" />

    <xsl:variable name="new-jd" select="floor($total-seconds div 86400)"/>  
    <xsl:variable name="new-hour" select="floor($total-seconds mod 86400 div 3600)"/>
    <xsl:variable name="new-minute" select="floor($total-seconds mod 3600 div 60)"/>
    <xsl:variable name="new-second" select="$total-seconds mod 60"/>

    <xsl:variable name="f" select="$new-jd + 1401 + floor((floor((4 * $new-jd + 274277) div 146097) * 3) div 4) - 38"/>
    <xsl:variable name="e" select="4*$f + 3"/>
    <xsl:variable name="g" select="floor(($e mod 1461) div 4)"/>
    <xsl:variable name="h" select="5*$g + 2"/>
    <xsl:variable name="D" select="floor(($h mod 153) div 5 ) + 1"/>
    <xsl:variable name="M" select="(floor($h div 153) + 2) mod 12 + 1"/>
    <xsl:variable name="Y" select="floor($e div 1461) - 4716 + floor((14 - $M) div 12)"/>

    <xsl:value-of select="concat($Y, format-number($M, '-00'), format-number($D, '-00'))"/>
    <xsl:text>T</xsl:text>
    <xsl:value-of select="concat(format-number($new-hour, '00'), format-number($new-minute, ':00'), format-number($new-second, ':00.###'))"/>
</xsl:template>
