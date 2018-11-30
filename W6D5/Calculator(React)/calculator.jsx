import React from 'react';

class Calculator extends React.Component {
    constructor(props) {
        super(props);

        this.state =  {num1: '', num2: '', result: 0};
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.add = this.add.bind(this);
        this.sub = this.sub.bind(this);
        this.multiply = this.multiply.bind(this);
        this.divide = this.divide.bind(this);
        this.clear = this.clear.bind(this);

    }

    render() {
        const { num1, num2, result } = this.state;
        return (
            <div>
                <h1 style="color:blue;">{this.state.result}</h1> 
                <input onChange = {this.setNum1} value = {this.state.num1} />
                <input onChange = {this.setNum2} value = {this.state.num2} />
                <br />
                <br />
                <button onClick={this.clear}> Clear </button>
                <br />
                <br />
                <button onClick = {this.add}> + </button>
                <button onClick = {this.sub}> - </button>
                <button onClick = {this.multiply}> * </button>
                <button onClick = {this.divide}> / </button>
            </div>
        );
    }

    setNum1(e) {
        const num1 = e.target.value ? parseInt(e.target.value) : "";
        this.setState({ num1 });
    }

    setNum2(e) {
        const num2 = e.target.value ? parseInt(e.target.value) : "";
        this.setState({ num2 });
    }

    add(e) {
        e.preventDefault();
        const result = this.state.num1 + this.state.num2;
        this.setState({ result });
    }


    sub(e) {
        e.preventDefault();
        const result = this.state.num1 - this.state.num2;
        this.setState({ result });
    }

    multiply(e) {
        e.preventDefault();
        const result = this.state.num1 * this.state.num2;
        this.setState({ result });
    }

    divide(e) {
        e.preventDefault();
        const result = this.state.num1 / this.state.num2;
        this.setState({ result });
    }

    clear(e){
        e.preventDefault();
        const result = this.state.num1 + this.state.num2;
        this.setState({ result });
    }

}

export default Calculator;