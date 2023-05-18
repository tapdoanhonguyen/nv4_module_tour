<!-- BEGIN: main -->
<div class="cat-tour">
	<div class="col-md-12">
		<div class="first-items">
			<div class="image">
				<a href="{FIRST.link}"><img src="{FIRST.img}" alt="{FIRST.title_clean}"></a>
			</div>
			<div class="info">
				<h3><a href="{FIRST.link}" title="{FIRST.title}">{FIRST.title_clean}</a></h3>
				<!-- BEGIN: price -->
				<!-- BEGIN: discounts -->
				<span class="money">{FIRST_PRICE.sale_format} đ</span> <span class="discounts_money">{FIRST_PRICE.price_format} đ</span>
				<!-- END: discounts -->
				<!-- BEGIN: no_discounts -->
				<span class="money no-discount">{FIRST_PRICE.price_format} đ</span>
				<!-- END: no_discounts -->
				<!-- END: price -->
				<!-- BEGIN: contact -->
				{LANG.price}: <span class="money">{LANG.contact}</span>
				<!-- END: contact -->
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="row">
		<!-- BEGIN: loop -->
		<div class="col-md-12">
			<div class="items">
				<div class="image">
					<a href="{ROW.link}"><img src="{ROW.thumb}" alt="{ROW.title_clean}"></a>
				</div>
				<div class="info">
					<h3><a href="{ROW.link}" title="{ROW.title}">{ROW.title_clean}</a></h3>
					<!-- BEGIN: price -->
					<!-- BEGIN: discounts -->
					<span class="money">{PRICE.sale_format} đ</span> <span class="discounts_money">{PRICE.price_format} đ</span>
					<!-- END: discounts -->
					<!-- BEGIN: no_discounts -->
					<span class="money no-discount">{PRICE.price_format} đ</span>
					<!-- END: no_discounts -->
					<!-- END: price -->
					<!-- BEGIN: contact -->
					{LANG.price}: <span class="money">{LANG.contact}</span>
					<!-- END: contact -->
				</div>
			</div>
		</div>
		<!-- END: loop -->
		</div>
	</div>
</div>
<!-- END: main -->