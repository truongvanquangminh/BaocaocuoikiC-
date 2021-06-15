namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        [Display(Name="Tên sản phẩm")]
        public string Name { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Giá sản phẩm")]
        public decimal UnitCost { get; set; }
        [Display(Name ="Số lượng")]
        public int Quantity { get; set; }

        [StringLength(100)]
        [Display(Name ="Hình ảnh")]
        public string Image { get; set; }

        [StringLength(300)]
        [Display(Name ="Mô tả")]
        public string Description { get; set; }

        [StringLength(50)]
        [Display(Name ="Trạng thái")]
        public string Status { get; set; }
        
        public int? CategoryID { get; set; }

        public virtual Category Category { get; set; }
    }
}
